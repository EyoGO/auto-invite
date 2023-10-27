local eventFlag = "OFF"

local function ToggleEventRegistration(fr)
    if eventFlag == "ON" then
        fr:RegisterEvent("CHAT_MSG_WHISPER")
        fr:RegisterEvent("CHAT_MSG_GUILD")
    else
        fr:UnregisterEvent("CHAT_MSG_WHISPER")
        fr:UnregisterEvent("CHAT_MSG_GUILD")
    end
end

local function OnEvent(self, event, ...)
    local text, playerName = ...
    if eventFlag == "ON" and strlower(strtrim(text)) == "+2" then
        InviteUnit(playerName)
    end
end

local f = CreateFrame("Frame")
ToggleEventRegistration(f)

SLASH_AUTOINVITE1 = "/autoinvite"
SLASH_AUTOINVITE2 = "/ai"
SlashCmdList.AUTOINVITE = function(msg, editBox)
    if eventFlag == "ON" then
        eventFlag = "OFF"
    else
        eventFlag = "ON"
    end
    ToggleEventRegistration(f)
    print("Autoinvite is now " .. eventFlag)
end

f:SetScript("OnEvent", OnEvent)