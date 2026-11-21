#!/usr/bin/env python3
"""Fold the server's own translations into an already-built Questie-X-CoADB, offline.

The CoA world DB keeps its Chinese in the four *_locale tables, so the player-facing text of a
custom quest, NPC, object or item can be replaced without touching anything else in the record:

  quests     Title -> questData[id][1], Objectives -> [8]
  creatures  Name -> npcData[entry][1], Title (the <subname>) -> [14]
  objects    name -> objectData[entry][1]
  items      Name -> itemData[id][1]

Spawns, levels, givers, drops and every other field stay exactly as built. A record the export does
not mention keeps its English text, so exporting one table and merging it on its own is fine.

Usage (paths are whatever Navicat wrote; any of the four may be omitted)
  py -3 tools/coadb/merge_locale.py --quests quest_template_locale.csv \
      --creatures creature_template_locale.csv --objects gameobject_template_locale.csv \
      --items item_template_locale.csv [--data-dir Questie-X-CoADB/Data] [--dry-run]

CSV: first row is the column names, UTF-8, comma separated, quoted where the value needs it (the
Navicat defaults). Rows of other locales are ignored (--locale, default zhCN), and columns are
matched by name, case-insensitively: ID/entry, Name/name, Title, Objectives.
"""
import argparse
import csv
import os
import re
import sys


def lua_str(v):
    return '"' + v.replace("\\", "\\\\").replace('"', '\\"').replace("\n", "\\n").replace("\r", "") + '"'


def clean(text):
    """The same scrubbing build_coadb.py applies to the English text."""
    if not text:
        return None
    text = text.replace("$B", " ").replace("$b", " ")
    text = re.sub(r"\$[Nn]", "<name>", text)
    text = re.sub(r"\$[Cc]", "<class>", text)
    text = re.sub(r"\$[Rr]", "<race>", text)
    text = re.sub(r"\$[Gg]([^:;]*):([^;]*);", r"\1", text)
    return re.sub(r"\s+", " ", text).strip() or None


def read_table(path, locale, id_names, wanted):
    """{id: {column: value}} for one locale table."""
    rows = {}
    with open(path, newline="", encoding="utf-8-sig") as f:
        reader = csv.DictReader(f)
        names = {(c or "").strip().lower(): c for c in (reader.fieldnames or [])}
        id_col = next((names[n] for n in id_names if n in names), None)
        if id_col is None:
            raise SystemExit("%s: no %s column (found: %s)" % (path, "/".join(id_names), ", ".join(names.values())))
        locale_col = names.get("locale")
        cols = {k: names[k] for k in wanted if k in names}
        for row in reader:
            if locale_col and (row.get(locale_col) or "").strip() != locale:
                continue
            key = (row.get(id_col) or "").strip()
            if not key.isdigit():
                continue
            rows[int(key)] = {k: (row.get(c) or "") for k, c in cols.items()}
    return rows


FIRST_STRING = r'\[1\]="(?:\\.|[^"\\])*"'
SUBNAME = r'\[14\]="(?:\\.|[^"\\])*"'
OBJECTIVES = r'\[8\]=\{"(?:\\.|[^"\\])*"\}'


def replace_name(body, text):
    new, n = re.subn(FIRST_STRING, lambda m: "[1]=" + lua_str(text), body, count=1)
    return new, n


def replace_subname(body, text):
    new, n = re.subn(SUBNAME, lambda m: "[14]=" + lua_str(text), body, count=1)
    return new, n


def replace_objectives(body, text):
    if re.search(OBJECTIVES, body):
        return re.sub(OBJECTIVES, lambda m: "[8]={" + lua_str(text) + "}", body, count=1), 1
    if body.endswith("}"):
        return body[:-1] + "[8]={" + lua_str(text) + "}}", 1
    return body, 0


def merge(data_dir, stem, rows, kind, dry_run):
    if not rows:
        return 0
    pattern = re.compile(r"^d\[(\d+)\]=(.*)$")
    touched = 0
    for name in sorted(os.listdir(data_dir)):
        if not (name.startswith(stem) and name.endswith(".lua")):
            continue
        path = os.path.join(data_dir, name)
        with open(path, newline="", encoding="utf-8") as f:
            lines = f.read().splitlines(keepends=True)
        out, here = [], 0
        for line in lines:
            ending = line[len(line.rstrip("\r\n")):]
            body_line = line[:len(line) - len(ending)]
            m = pattern.match(body_line)
            if not m or int(m.group(1)) not in rows:
                out.append(line)
                continue
            row, body = rows[int(m.group(1))], m.group(2)
            fields = 0
            # quest_template_locale calls the title "Title"; creature/gameobject/item_template_locale
            # call the name "Name" and the NPC's <subname> "Title"
            if kind == "quest":
                text = clean(row.get("title") or "") or clean(row.get("name") or "")
            else:
                text = clean(row.get("name") or "") or clean(row.get("title") or "")
            if text:
                body, n = replace_name(body, text)
                fields += n
            if kind == "npc":
                sub = clean(row.get("title") or "")
                if sub:
                    body, n = replace_subname(body, sub)
                    fields += n
            if kind == "quest":
                obj = clean(row.get("objectives") or "")
                if obj:
                    body, n = replace_objectives(body, obj)
                    fields += n
            if fields:
                here += 1
                out.append("d[%s]=%s%s" % (m.group(1), body, ending))
            else:
                out.append(line)
        if here and not dry_run:
            with open(path, "w", encoding="utf-8", newline="") as f:
                f.write("".join(out))
        if here:
            print("%-18s %5d records %s" % (name, here, "would change" if dry_run else "rewritten"))
        touched += here
    return touched


def main():
    p = argparse.ArgumentParser(description="Fold the server's *_locale text into a built Questie-X-CoADB")
    p.add_argument("--data-dir", default=os.path.join("Questie-X-CoADB", "Data"))
    p.add_argument("--quests", help="quest_template_locale export")
    p.add_argument("--creatures", help="creature_template_locale export")
    p.add_argument("--objects", help="gameobject_template_locale export")
    p.add_argument("--items", help="item_template_locale export")
    p.add_argument("--locale", default="zhCN")
    p.add_argument("--dry-run", action="store_true")
    args = p.parse_args()
    if not os.path.isdir(args.data_dir):
        raise SystemExit("no data directory: " + args.data_dir)
    if not any((args.quests, args.creatures, args.objects, args.items)):
        raise SystemExit("nothing to merge: pass at least one --quests/--creatures/--objects/--items")
    total = 0
    total += merge(args.data_dir, "CoAQuestDB", read_table(args.quests, args.locale, ("id",), ("title", "objectives")) if args.quests else {}, "quest", args.dry_run)
    total += merge(args.data_dir, "CoANpcDB", read_table(args.creatures, args.locale, ("entry", "id"), ("name", "title")) if args.creatures else {}, "npc", args.dry_run)
    total += merge(args.data_dir, "CoAObjectDB", read_table(args.objects, args.locale, ("entry", "id"), ("name",)) if args.objects else {}, "object", args.dry_run)
    total += merge(args.data_dir, "CoAItemDB", read_table(args.items, args.locale, ("id", "entry"), ("name",)) if args.items else {}, "item", args.dry_run)
    print("total: %d records %s" % (total, "would be rewritten" if args.dry_run else "rewritten"))
    return 0


if __name__ == "__main__":
    sys.exit(main())
