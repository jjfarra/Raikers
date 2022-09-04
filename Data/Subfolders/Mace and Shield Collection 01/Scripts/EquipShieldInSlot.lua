--[[ -- Internal custom properties
local EQUIPMENT = script:FindAncestorByType('Equipment')
if not EQUIPMENT:IsA('Equipment') then
    error(script.name .. " should be part of Equipment object hierarchy.")
end


function OnEquipped(equipment, player)
    local WEAPON_GEOS = script.parent:GetChildren()

    for _, geo in pairs(WEAPON_GEOS) do
        local shield = geo:GetCustomProperty("Shield")
        shield:AttachToPlayer(player, "left_slot")
    end
end

function OnUnequipped(equipment, player)


end

EQUIPMENT.equippedEvent:Connect(OnEquipped)
EQUIPMENT.unequippedEvent:Connect(OnUnequipped) ]]