
local EQUIPMENT = script:FindAncestorByType("Equipment")
local EXTRA_HP = script:GetCustomProperty("ExtraHitPoints")


function OnEquipped(equipment, player)
	local p = player.hitPoints / player.maxHitPoints
	
	player.maxHitPoints = player.maxHitPoints + EXTRA_HP
	player.hitPoints = p * player.maxHitPoints
end


function OnUnequipped(equipment, player)
	local p = player.hitPoints / player.maxHitPoints
	
	player.maxHitPoints = player.maxHitPoints - EXTRA_HP
	player.hitPoints = p * player.maxHitPoints
end

EQUIPMENT.equippedEvent:Connect(OnEquipped)
EQUIPMENT.unequippedEvent:Connect(OnUnequipped)