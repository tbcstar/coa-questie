---@type l10n
local l10n = QuestieLoader:ImportModule("l10n")

-- The arrow tab and the arrow's own distance label (both added by this fork: the arrow shows
-- "[level] target" and "Distance: 49.1 yd", which used to be English in every language).
local arrowLocales = {
    ["Arrow"] = {
        ["enUS"] = true,
        ["zhCN"] = "箭头",
        ["zhTW"] = "箭頭",
    },
    ["Arrow Options"] = {
        ["enUS"] = true,
        ["zhCN"] = "箭头选项",
        ["zhTW"] = "箭頭選項",
    },
    ["Enable Arrow"] = {
        ["enUS"] = true,
        ["zhCN"] = "启用箭头",
        ["zhTW"] = "啟用箭頭",
    },
    ["Show the Questie arrow and auto-track the nearest objective or turn-in location."] = {
        ["enUS"] = true,
        ["zhCN"] = "显示 Questie 箭头，并自动追踪最近的任务目标或交任务地点。",
        ["zhTW"] = "顯示 Questie 箭頭，並自動追蹤最近的任務目標或交任務地點。",
    },
    ["Arrow Style"] = {
        ["enUS"] = true,
        ["zhCN"] = "箭头样式",
        ["zhTW"] = "箭頭樣式",
    },
    ["Choose which arrow artwork Questie uses. Sprite sheets animate through directional frames; regular images rotate as a single texture."] = {
        ["enUS"] = true,
        ["zhCN"] = "选择箭头使用的贴图：序列图按方向逐帧播放，普通图片则整体旋转。",
        ["zhTW"] = "選擇箭頭使用的貼圖：序列圖依方向逐格播放，普通圖片則整體旋轉。",
    },
    ["Custom Arrow File"] = {
        ["enUS"] = true,
        ["zhCN"] = "自定义箭头文件",
        ["zhTW"] = "自訂箭頭檔案",
    },
    ["Enter the filename of a .tga file placed in Icons\\Arrows. Only the file name is used, not the full path."] = {
        ["enUS"] = true,
        ["zhCN"] = "填入放在 Icons\\Arrows 目录下的 .tga 文件名：只认文件名，不认完整路径。",
        ["zhTW"] = "填入放在 Icons\\Arrows 目錄下的 .tga 檔名：只認檔名，不認完整路徑。",
    },
    ["Custom Is Sprite Sheet"] = {
        ["enUS"] = true,
        ["zhCN"] = "自定义文件是序列图",
        ["zhTW"] = "自訂檔案是序列圖",
    },
    ["Enable this only if your custom TGA is a directional sprite sheet."] = {
        ["enUS"] = true,
        ["zhCN"] = "只有当你自定义的 TGA 是带方向的分帧序列图时才开启。",
        ["zhTW"] = "只有當你自訂的 TGA 是帶方向的分格序列圖時才開啟。",
    },
    ["Arrow Scale"] = {
        ["enUS"] = true,
        ["zhCN"] = "箭头大小",
        ["zhTW"] = "箭頭大小",
    },
    ["Change the size of the arrow"] = {
        ["enUS"] = true,
        ["zhCN"] = "调整箭头的大小",
        ["zhTW"] = "調整箭頭的大小",
    },
    ["Lock Arrow Position"] = {
        ["enUS"] = true,
        ["zhCN"] = "锁定箭头位置",
        ["zhTW"] = "鎖定箭頭位置",
    },
    ["Prevent the arrow frame from being moved independently."] = {
        ["enUS"] = true,
        ["zhCN"] = "箭头不能被单独拖动。",
        ["zhTW"] = "箭頭不能被單獨拖動。",
    },
    ["Lock Objective Position"] = {
        ["enUS"] = true,
        ["zhCN"] = "锁定目标文字位置",
        ["zhTW"] = "鎖定目標文字位置",
    },
    ["Prevent the objective text block from being moved independently."] = {
        ["enUS"] = true,
        ["zhCN"] = "目标文字块不能被单独拖动。",
        ["zhTW"] = "目標文字區塊不能被單獨拖動。",
    },
    ["Attach Objective To Arrow"] = {
        ["enUS"] = true,
        ["zhCN"] = "目标文字跟随箭头",
        ["zhTW"] = "目標文字跟隨箭頭",
    },
    ["Keep the objective block anchored to the arrow instead of moving it separately."] = {
        ["enUS"] = true,
        ["zhCN"] = "目标文字块固定在箭头上，而不是单独移动。",
        ["zhTW"] = "目標文字區塊固定在箭頭上，而不是單獨移動。",
    },
    ["Attached Gap"] = {
        ["enUS"] = true,
        ["zhCN"] = "间距",
        ["zhTW"] = "間距",
    },
    ["Control the spacing between the arrow and the attached objective block."] = {
        ["enUS"] = true,
        ["zhCN"] = "调整箭头与目标文字块之间的距离。",
        ["zhTW"] = "調整箭頭與目標文字區塊之間的距離。",
    },
    ["Arrow Transparency"] = {
        ["enUS"] = true,
        ["zhCN"] = "箭头透明度",
        ["zhTW"] = "箭頭透明度",
    },
    ["Change the transparency of the arrow"] = {
        ["enUS"] = true,
        ["zhCN"] = "调整箭头的透明度",
        ["zhTW"] = "調整箭頭的透明度",
    },
    ["Objective Transparency"] = {
        ["enUS"] = true,
        ["zhCN"] = "目标文字透明度",
        ["zhTW"] = "目標文字透明度",
    },
    ["Change the transparency of the objective text block"] = {
        ["enUS"] = true,
        ["zhCN"] = "调整目标文字块的透明度",
        ["zhTW"] = "調整目標文字區塊的透明度",
    },
    ["Distance Units"] = {
        ["enUS"] = true,
        ["zhCN"] = "距离单位",
        ["zhTW"] = "距離單位",
    },
    ["Choose the unit used for the distance label."] = {
        ["enUS"] = true,
        ["zhCN"] = "选择距离显示使用的单位。",
        ["zhTW"] = "選擇距離顯示使用的單位。",
    },
    ["Arrow Font"] = {
        ["enUS"] = true,
        ["zhCN"] = "箭头字体",
        ["zhTW"] = "箭頭字體",
    },
    ["The font used for the arrow distance and title text."] = {
        ["enUS"] = true,
        ["zhCN"] = "箭头上的名字与距离使用的字体。",
        ["zhTW"] = "箭頭上的名字與距離使用的字體。",
    },
    ["Arrow Font Size"] = {
        ["enUS"] = true,
        ["zhCN"] = "箭头字号",
        ["zhTW"] = "箭頭字號",
    },
    ["The font size used for the arrow distance and title text."] = {
        ["enUS"] = true,
        ["zhCN"] = "箭头上的名字与距离使用的字号。",
        ["zhTW"] = "箭頭上的名字與距離使用的字號。",
    },
    ["Auto-track Quests"] = {
        ["enUS"] = true,
        ["zhCN"] = "自动追踪任务",
        ["zhTW"] = "自動追蹤任務",
    },
    ["Automatically track all quests in your quest log. If disabled, only manually tracked quests will show on the arrow."] = {
        ["enUS"] = true,
        ["zhCN"] = "自动追踪任务日志里的所有任务；关闭后箭头只显示你手动追踪的任务。",
        ["zhTW"] = "自動追蹤任務日誌中的所有任務；關閉後箭頭只顯示你手動追蹤的任務。",
    },
    ["Reset Arrow Position"] = {
        ["enUS"] = true,
        ["zhCN"] = "重置箭头位置",
        ["zhTW"] = "重設箭頭位置",
    },
    ["Reset the arrow position to the center of the screen"] = {
        ["enUS"] = true,
        ["zhCN"] = "把箭头放回屏幕中央",
        ["zhTW"] = "把箭頭放回螢幕中央",
    },
    ["Reset Objective Position"] = {
        ["enUS"] = true,
        ["zhCN"] = "重置目标文字位置",
        ["zhTW"] = "重設目標文字位置",
    },
    ["Reset the objective text block position to its default"] = {
        ["enUS"] = true,
        ["zhCN"] = "把目标文字块放回默认位置",
        ["zhTW"] = "把目標文字區塊放回預設位置",
    },
    ["Reset & Reattach"] = {
        ["enUS"] = true,
        ["zhCN"] = "重置并重新附着",
        ["zhTW"] = "重設並重新附著",
    },
    ["Reset both arrow layouts and reattach the objective block to the arrow."] = {
        ["enUS"] = true,
        ["zhCN"] = "同时重置箭头与目标文字的位置，并让目标文字重新跟随箭头。",
        ["zhTW"] = "同時重設箭頭與目標文字的位置，並讓目標文字重新跟隨箭頭。",
    },
    ["Debug Arrow"] = {
        ["enUS"] = true,
        ["zhCN"] = "箭头调试",
        ["zhTW"] = "箭頭除錯",
    },
    ["Show debug information about the arrow target in chat"] = {
        ["enUS"] = true,
        ["zhCN"] = "在聊天框输出箭头目标的调试信息",
        ["zhTW"] = "在聊天框輸出箭頭目標的除錯資訊",
    },
    ["Print Current Target"] = {
        ["enUS"] = true,
        ["zhCN"] = "输出当前目标",
        ["zhTW"] = "輸出目前目標",
    },
    ["Print the current arrow target coordinates to chat"] = {
        ["enUS"] = true,
        ["zhCN"] = "把当前箭头目标的坐标输出到聊天框",
        ["zhTW"] = "把目前箭頭目標的座標輸出到聊天框",
    },
    ["Debug Print Arrow State"] = {
        ["enUS"] = true,
        ["zhCN"] = "输出箭头状态",
        ["zhTW"] = "輸出箭頭狀態",
    },
    ["Print detailed debug info about arrow state to chat"] = {
        ["enUS"] = true,
        ["zhCN"] = "把箭头的详细调试信息输出到聊天框",
        ["zhTW"] = "把箭頭的詳細除錯資訊輸出到聊天框",
    },
    ["Clear Target"] = {
        ["enUS"] = true,
        ["zhCN"] = "清除目标",
        ["zhTW"] = "清除目標",
    },
    ["Clear the current arrow target and resume auto-tracking"] = {
        ["enUS"] = true,
        ["zhCN"] = "清除当前箭头目标，并恢复自动追踪",
        ["zhTW"] = "清除目前箭頭目標，並恢復自動追蹤",
    },
    ["Yards"] = {
        ["enUS"] = true,
        ["zhCN"] = "码",
        ["zhTW"] = "碼",
    },
    ["Meters"] = {
        ["enUS"] = true,
        ["zhCN"] = "米",
        ["zhTW"] = "米",
    },
    ["Feet"] = {
        ["enUS"] = true,
        ["zhCN"] = "英尺",
        ["zhTW"] = "英尺",
    },
    ["Custom"] = {
        ["enUS"] = true,
        ["zhCN"] = "自定义",
        ["zhTW"] = "自訂",
    },
    ["Distance: %s"] = {
        ["enUS"] = true,
        ["zhCN"] = "距离：%s",
        ["zhTW"] = "距離：%s",
    },
    ["Distance: --"] = {
        ["enUS"] = true,
        ["zhCN"] = "距离：--",
        ["zhTW"] = "距離：--",
    },
    ["%.1f yd"] = {
        ["enUS"] = true,
        ["zhCN"] = "%.1f 码",
        ["zhTW"] = "%.1f 碼",
    },
    ["%.1f m"] = {
        ["enUS"] = true,
        ["zhCN"] = "%.1f 米",
        ["zhTW"] = "%.1f 米",
    },
    ["%.1f ft"] = {
        ["enUS"] = true,
        ["zhCN"] = "%.1f 英尺",
        ["zhTW"] = "%.1f 英尺",
    },
}

-- Additive on purpose: "Custom" and friends may already carry other languages upstream, and
-- flattening the entry would throw them away.
for key, entry in pairs(arrowLocales) do
    local existing = l10n.translations[key]
    if existing then
        for lang, value in pairs(entry) do
            if existing[lang] == nil then
                existing[lang] = value
            end
        end
    else
        l10n.translations[key] = entry
    end
end
