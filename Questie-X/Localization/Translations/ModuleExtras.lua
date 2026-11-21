-- ModuleExtras.lua
-- Strings outside the options window: tracker, tooltips, tutorials, slash commands.
-- Added for the CoA/WotLK fork's own strings: upstream ships these keys with ["zhCN"] = false,
-- so the client fell back to English. Keys the client already translated are never overwritten.
---@type l10n
local l10n = QuestieLoader:ImportModule("l10n")

local extra = {
    -- Journey\QuestieSearchResults.lua
    ["\\nWhen selected, hides the quest from the map, even if it is active.\\n\\nHiding a quest is also possible by Shift-clicking it on the map."] = "\n勾选后，即使任务正在进行中，也会把它从地图上隐藏。\n\n在地图上按住 Shift 点击任务也可以隐藏它。",
    ["No quests to list."] = "没有可列出的任务。",
    ["Doable"] = "可执行",
    ["Requires all of these quests to be finished:"] = "需要完成以下全部任务：",
    ["Requires one of these quests to be finished:"] = "需要完成以下任一任务：",
    ["This item is blacklisted because it has too many sources"] = "此物品来源过多，已被列入黑名单",
    ["NPCs"] = "NPC",
    ["No NPC drops this item"] = "没有 NPC 掉落此物品",
    ["%d NPCs drop this item"] = "%d 个 NPC 掉落此物品",
    ["No Object drops this item"] = "没有物件掉落此物品",
    ["%d Objects drop this item"] = "%d 个物件掉落此物品",
    ["No Vendor sells this item"] = "没有商人出售此物品",
    ["%d Vendors sell this item"] = "%d 个商人出售此物品",
    -- QuestieDebugOffer.lua
    ["An item you just encountered has data missing from the Questie database."] = "你刚刚遇到的物品在 Questie 数据库中缺少数据。",
    ["Would you like to help us fix it?"] = "要帮我们修正它吗？",
    ["More Info"] = "更多信息",
    ["A quest you just encountered is missing from the Questie database."] = "你刚刚遇到的任务在 Questie 数据库中不存在。",
    ["The NPC you just targeted is missing from the Questie database."] = "你刚刚选中的 NPC 在 Questie 数据库中不存在。",
    ["Questie Debug Info"] = "Questie 调试信息",
    ["Please share this info with us on"] = "请把这份信息分享给我们：",
    ["You can copy the data above"] = "你可以复制上面的数据",
    ["Dismiss"] = "忽略",
    -- Tooltips\MapIconTooltip.lua
    ["Rare Elite"] = "稀有精英",
    ["Rare"] = "稀有",
    ["Next in chain:"] = "任务链下一环：",
    ["PvP"] = "PvP",
    ["Rune"] = "符文",
    -- Tracker\TrackerHeaderFrame.lua
    ["Questie Tracker Integrations"] = "Questie 追踪器集成",
    ["VoiceOver"] = "VoiceOver",
    ["Hold shift to see PlayButtons"] = "按住 Shift 查看播放按钮",
    ["TomTom"] = "TomTom",
    ["Ctrl + Left Click or Right Click a Quest Title"] = "Ctrl + 左键或右键点击任务标题",
    -- Tutorial\ShowRunes.lua
    ["Questie can show you the locations of Phase 1 & 2 runes for your class.\\n\\n"] = "Questie 可以为你显示本职业第一阶段与第二阶段符文的位置。\n\n",
    ["Please choose if you want to see them or not\\n"] = "请选择是否要看到它们\n",
    ["Rune locations are marked with the following symbol:"] = "符文位置用以下符号标记：",
    ["(This can always be changed in the Icons tab of the settings)"] = "（随时可以在设置的图标页更改）",
    -- QuestieSlash.lua
    ["Self-learning database: toggle on/off, view stats, clear data, or export"] = "自学习数据库：开关、查看统计、清除数据或导出",
    ["Prints whether you are eligibile to do a quest"] = "显示你是否有资格执行某个任务",
    ["Prints Questie and client version info"] = "显示 Questie 与客户端版本信息",
    -- Tracker\QuestieTracker.lua
    ["Blizzard Timer Active"] = "暴雪计时器已激活",
    ["You may only track 10 achievements at a time."] = "你最多只能同时追踪 10 个成就。",
    -- Tracker\TrackerMenu.lua
    ["Maximize Quest"] = "最大化任务",
    ["Copied URL to clipboard"] = "已复制链接到剪贴板",
    -- FramePool\QuestieFramePool.lua
    ["Are you sure you want to hide the quest '%s'?\\nIf this quest isn't actually available, please report it to us!"] = "你确定要隐藏任务「%s」吗？\n如果这个任务实际上不可用，请反馈给我们！",
    -- Network\QuestieComms.lua
    [" Yours: v"] = " 你的版本：v",
    -- Tracker\TrackerBaseFrame.lua
    ["The Tracker Height Ratio\\nis ignored while in Manual mode"] = "手动模式下会忽略\n追踪器高度比例",
    -- Tracker\TrackerLinePool.lua
    ["You can't untrack an objective of an achievement."] = "你不能取消追踪成就的目标。",
    -- Tutorial\ChooseObjectiveType.lua
    ["With WotLK Phase 4 Blizzard introduced their own quest objective system.\\n\\nPlease choose the objective style you want to use:"] = "自巫妖王之怒第四阶段起，暴雪引入了自己的任务目标系统。\n\n请选择你想使用的目标样式：",
    -- Arrow\QuestieArrow.lua
    ["Custom"] = "自定义",
    -- Map\QuestieMap.lua
    ["NPC"] = "NPC",

    -- Modules\Tracker\TrackerHeaderFrame.lua (tracker integrations)
    ["VoiceOver"] = "语音播报",
    ["TomTom"] = "TomTom",

    -- Modules\Tooltips\MapIconTooltip.lua + search results (short tags)
    ["PvP"] = "PvP",
    ["NPC"] = "NPC",
    ["NPCs"] = "NPC",

    -- Modules\Tutorial\ShowRunes.lua
    ["Questie can show you the locations of Phase 1 & 2 runes for your class.\n\n"] = "Questie 可以显示你职业第一阶段与第二阶段符文的埋藏地点。\n\n",
    ["Please choose if you want to see them or not\n"] = "请选择是否要看到它们\n",
}

for key, value in pairs(extra) do
    local existing = l10n.translations[key]
    if existing then
        local current = existing["zhCN"]
        if current == nil or current == false then
            existing["zhCN"] = value
        end
    else
        l10n.translations[key] = { ["enUS"] = true, ["zhCN"] = value }
    end
end

-- Upstream marks a few labels ["zhCN"] = true ("same as English"), which the loop above respects.
-- This one does have a Chinese form, so it is set outright.
if l10n.translations["VoiceOver"] then
    l10n.translations["VoiceOver"]["zhCN"] = "语音播报"
end
