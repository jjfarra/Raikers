--[[
	
	Initial blocking mechanics
	- Change animationStance to "1hand_melee_shield_block"
	- Sets player:SetResource("isBlocking", 1) on binding press
	- Sets player:SetResource("isBlocking", 0) on binding release


]]--

local EQUIPMENT = script:FindAncestorByType('Equipment')
if not EQUIPMENT:IsA('Equipment') then
    error(script.name .. " should be part of Equipment object hierarchy.")
end

local ABILITY = script.parent

local DEFAULT_STANCE = "1hand_melee_stance"
local ANIMATION_STANCE = script:GetCustomProperty("AnimationStance")

if (ABILITY.owner) then
    DEFAULT_STANCE = ABILITY.owner.animationStance
end

function OnBindingPressed(player, binding)
	if (binding == "ability_secondary") then
		player.animationStance = ANIMATION_STANCE
		player:SetResource("isBlocking", 1)
    end
end

function OnBindingReleased(player, binding)
	if (binding == "ability_secondary") then 
		player.animationStance = DEFAULT_STANCE
		player:SetResource("isBlocking", 0)
		
    end
end

-- nil OnEquipped(Equipment)
function OnEquipped(equipment, player)
	player.bindingPressedEvent:Connect(OnBindingPressed)
	player.bindingReleasedEvent:Connect(OnBindingReleased)
end

-- nil OnUnequipped(Equipment)
function OnUnequipped(equipment)

end


-- Initialize
EQUIPMENT.equippedEvent:Connect(OnEquipped)
EQUIPMENT.unequippedEvent:Connect(OnUnequipped)


