
local TARGET = script:GetCustomProperty("Target"):WaitForObject()
local VELOCITY = script:GetCustomProperty("Velocity")

TARGET:LookAtLocalView(true)

local texts = TARGET:FindDescendantsByType("WorldText")


function SetMessage(message)
	for _,t in ipairs(texts) do
		t.text = message
	end
end

function Tick(deltaTime)
	local pos = TARGET:GetPosition()
	pos.z = pos.z + deltaTime * VELOCITY
	TARGET:SetPosition(pos)
end