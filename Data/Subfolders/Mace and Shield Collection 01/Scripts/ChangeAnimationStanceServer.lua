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


-- function to connect event handlers to ability events 
function ConnectAbilityEvents(ability)
	-- hooks on entering each phase
	ability.castEvent:Connect(OnCast)
	ability.executeEvent:Connect(OnExecute)
	ability.recoveryEvent:Connect(OnRecovery)
	ability.cooldownEvent:Connect(OnCooldown)
	ability.interruptedEvent:Connect(OnInterrupted)
	ability.readyEvent:Connect(OnReady)
			
end

-- functions called when entering each phase. Add your code inside 
function OnCast(ability)

end

function OnExecute(ability)
	
	-- if isTargetDataUpdated is set to true on ability phase, targetData can be used
	-- local targetData = ability:GetTargetData()
end

function OnRecovery(ability)
	-- print("OnRecovery " .. ability.name)
end

function OnCooldown(ability)
	-- print("OnCooldown " .. ability.name)
end

function OnInterrupted(ability)
	-- print("OnInterrupted " .. ability.name)
end

function OnReady(ability)
	-- print("OnReady " .. ability.name)
end

print("WORKING SO FAR: ".. EQUIPMENT.name)

function OnBindingPressed(player, binding)
	print("player " .. player.name .. " pressed binding: " .. binding)
	if (binding == "ability_secondary") then 
        player.animationStance = ANIMATION_STANCE

    end
end

function OnBindingReleased(player, binding)
	print("player " .. player.name .. " released binding: " .. binding)
	if (binding == "ability_secondary") then 
        player.animationStance = DEFAULT_STANCE
    end
end

-- nil OnEquipped(Equipment)
function OnEquipped(equipment, player)
	print("PLAYER EQUIPPED: ".. player.name)
	player.bindingPressedEvent:Connect(OnBindingPressed)
	player.bindingReleasedEvent:Connect(OnBindingReleased)

end

-- nil OnUnequipped(Equipment)
function OnUnequipped(equipment)

end


-- ConnectAbilityEvents(ABILITY)

-- Initialize
EQUIPMENT.equippedEvent:Connect(OnEquipped)
EQUIPMENT.unequippedEvent:Connect(OnUnequipped)


