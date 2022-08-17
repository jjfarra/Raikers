local ROOT = script:GetCustomProperty("Root"):WaitForObject()
local BUTTON = script:GetCustomProperty("Button"):WaitForObject()

function OnClicked(whichButton)
    if ROOT.clientUserData.dialogId then
        Events.Broadcast("DialogOptionSelect", ROOT.clientUserData.dialogId)
    end
end

BUTTON.clickedEvent:Connect(OnClicked)

local optionName = ROOT.clientUserData.optionName

while not optionName do
    optionName = ROOT.clientUserData.optionName
    Task.Wait()
end

BUTTON.text = optionName