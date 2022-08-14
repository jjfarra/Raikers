local TRIGGER = script.parent
local NPC = script:GetCustomProperty("Humanoid2Rig"):WaitForObject()
local ROOT_COMPONENT = script:GetCustomProperty("RootComponent"):WaitForObject()
local NPC_TEMPLATE = ROOT_COMPONENT:GetCustomProperty("NPCTemplate")

function OnBeginOverlap(trigger, other)
	if other == nil or not other:IsA("Player") then return end
	NPC:PlayAnimation("unarmed_wave")
	NPC:LookAt(other:GetWorldPosition())
	Events.Broadcast("NPCStartDialog", NPC_TEMPLATE)
end

function OnEndOverlap(trigger, other)
	if other == nil or not other:IsA("Player") then return end
	Events.Broadcast("NPCStopDialog")
end

TRIGGER.beginOverlapEvent:Connect(OnBeginOverlap)
TRIGGER.endOverlapEvent:Connect(OnEndOverlap)