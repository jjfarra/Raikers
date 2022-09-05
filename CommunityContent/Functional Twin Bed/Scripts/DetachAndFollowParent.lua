
local DESTROY_DELAY = script:GetCustomProperty("DestroyDelay") or 0

local target = script.parent
script.parent = nil
script:Follow(target)

function OnTargetDestroyed()
	if DESTROY_DELAY > 0 then
		script:StopMove()
		script.lifeSpan = DESTROY_DELAY
	else
		script:Destroy()
	end
end

target.destroyEvent:Connect(OnTargetDestroyed)


function Tick()
	if Object.IsValid(target) then
		script.visibility = target.visibility
	end
end