local MESH = script.parent:FindDescendantByType("AnimatedMesh")

local allObjects = script.parent:GetChildren()

for _,obj in ipairs(allObjects) do
	if obj:IsA("Folder") then
		local socketName = obj.name
		local pos = obj:GetWorldPosition()
		local rot = obj:GetWorldRotation()
		
		MESH:AttachCoreObject(obj, socketName)
		
		obj:SetWorldPosition(pos)
		obj:SetWorldRotation(rot)
	end
end

-- TEST
--MESH:PlayAnimation("1hand_melee_slash_right", {shouldLoop = true})

----[[
Task.Wait()
MESH.animationStance = "unarmed_idle_relaxed", {shouldLoop = true}

while true do
	randomwait=math.random(10)
	Task.Wait (randomwait)
	MESH:PlayAnimation("unarmed_wave", {playbackRate = 0.55})
	Task.Wait (randomwait)
	MESH.animationStance = "unarmed_idle_relaxed"
	Task.Wait(6)
end
--]]