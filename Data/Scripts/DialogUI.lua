local UI_CONTAINER = script:GetCustomProperty("UIContainer"):WaitForObject()
local POPSFX = script:GetCustomProperty("POPSFX"):WaitForObject()

UI_CONTAINER.visibility = Visibility.FORCE_OFF

function ShowUI()
	UI_CONTAINER.visibility = Visibility.FORCE_ON
	POPSFX:Play()
end

function HideUI()
	UI_CONTAINER.visibility = Visibility.FORCE_OFF
end

Events.Connect("NPCStartDialog", ShowUI)
Events.Connect("NPCStopDialog", HideUI)