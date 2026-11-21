---@type l10n
local l10n = QuestieLoader:ImportModule("l10n")

-- The Database tab is this fork's own screen (learning export/import), added
-- after the upstream string set, so its words were never in a translation
-- table. Keys are the English source strings (21 Nov 2026).
local databaseLocales = {
    ["Questie-X — Export Learned Data"] = {
        ["enUS"] = true,
        ["zhCN"] = "Questie-X — 导出学习到的数据",
        ["zhTW"] = "Questie-X — 匯出學習到的資料",
    },
    ["Select all and copy (Ctrl+A, Ctrl+C):"] = {
        ["enUS"] = true,
        ["zhCN"] = "全选并复制（Ctrl+A、Ctrl+C）：",
        ["zhTW"] = "全選並複製（Ctrl+A、Ctrl+C）：",
    },
    ["|cFFFFD700Server:|r %s    |cFFFFD700NPCs:|r %d    |cFFFFD700Quests:|r %d    |cFFFFD700Items:|r %d    |cFFFFD700Objects:|r %d    |cFFFFD700Total:|r %d entries"] = {
        ["enUS"] = true,
        ["zhCN"] = "|cFFFFD700服务器：|r %s    |cFFFFD700NPC：|r %d    |cFFFFD700任务：|r %d    |cFFFFD700物品：|r %d    |cFFFFD700物件：|r %d    |cFFFFD700合计：|r %d 条",
        ["zhTW"] = "|cFFFFD700伺服器：|r %s    |cFFFFD700NPC：|r %d    |cFFFFD700任務：|r %d    |cFFFFD700物品：|r %d    |cFFFFD700物件：|r %d    |cFFFFD700合計：|r %d 筆",
    },
    ["|cFF888888To share your data: copy this string and submit it on the Questie-X GitHub or Discord. Contributors help grow the quest database for everyone.|r"] = {
        ["enUS"] = true,
        ["zhCN"] = "|cFF888888分享你的数据：复制这段字符串，提交到 Questie-X 的 GitHub 或 Discord。贡献者能帮所有人扩充任务数据库。|r",
        ["zhTW"] = "|cFF888888分享你的資料：複製這段字串，提交到 Questie-X 的 GitHub 或 Discord。貢獻者能幫所有人擴充任務資料庫。|r",
    },
    ["Questie-X — Import Learned Data"] = {
        ["enUS"] = true,
        ["zhCN"] = "Questie-X — 导入学习到的数据",
        ["zhTW"] = "Questie-X — 匯入學習到的資料",
    },
    ["|cFF888888Paste a QxLD export string below, then click Validate.|r"] = {
        ["enUS"] = true,
        ["zhCN"] = "|cFF888888把 QxLD 导出字符串粘贴到下面，然后点「校验」。|r",
        ["zhTW"] = "|cFF888888把 QxLD 匯出字串貼到下面，然後點「校驗」。|r",
    },
    ["Paste export string here:"] = {
        ["enUS"] = true,
        ["zhCN"] = "在这里粘贴导出字符串：",
        ["zhTW"] = "在這裡貼上匯出字串：",
    },
    ["Validate"] = {
        ["enUS"] = true,
        ["zhCN"] = "校验",
        ["zhTW"] = "校驗",
    },
    ["Import"] = {
        ["enUS"] = true,
        ["zhCN"] = "导入",
        ["zhTW"] = "匯入",
    },
    ["|cFFFF0000Export module not loaded.|r"] = {
        ["enUS"] = true,
        ["zhCN"] = "|cFFFF0000导出模块未加载。|r",
        ["zhTW"] = "|cFFFF0000匯出模組未載入。|r",
    },
    ["|cFFFF0000Validation failed: %s|r"] = {
        ["enUS"] = true,
        ["zhCN"] = "|cFFFF0000校验失败：%s|r",
        ["zhTW"] = "|cFFFF0000校驗失敗：%s|r",
    },
    ["|cFF00FF00Valid! Server: %s  NPCs: %d  Quests: %d  Items: %d  Objects: %d  Total: %d|r"] = {
        ["enUS"] = true,
        ["zhCN"] = "|cFF00FF00校验通过！服务器：%s  NPC：%d  任务：%d  物品：%d  物件：%d  合计：%d|r",
        ["zhTW"] = "|cFF00FF00校驗通過！伺服器：%s  NPC：%d  任務：%d  物品：%d  物件：%d  合計：%d|r",
    },
    ["Loaded Questie-X Plugins"] = {
        ["enUS"] = true,
        ["zhCN"] = "已加载的 Questie-X 插件",
        ["zhTW"] = "已載入的 Questie-X 插件",
    },
}

for k, v in pairs(databaseLocales) do
    l10n.translations[k] = v
end
