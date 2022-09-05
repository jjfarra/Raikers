
local HEAL_VFX = script:GetCustomProperty("HealVfx")


function OnPlayerHealed(player, amountHealed)
	local vfx = World.SpawnAsset(HEAL_VFX)
	vfx:AttachToPlayer(player, "root")
	vfx:SetPosition(Vector3.New(0, 0, 100))
					
	Task.Wait()
	local flyupText = vfx:FindDescendantByType("Script")
	local str = "+" .. tostring(CoreMath.Round(amountHealed)) .. " "
	flyupText.context.SetMessage(str)
end

Events.Connect("PlayerHealed", OnPlayerHealed)