--[[
	Animation Controller - Spider
	v0.9
	by: PiousLachance(Gabriele)
	based off script by: standardcombo, blackedheart, Ocylix
	
	Controls the animations for an NPC based on no animated mesh
	Changes in animation occur in response to movement and state machine changes.
--]]

local ROOT = script:GetCustomProperty("Root"):WaitForObject()
local WALKING_SPEED = 0.1
local RUNNING_SPEED = 600

local run_anim_stance = script:GetCustomProperty("run_anim_stance"):WaitForObject()
local attack_anim_stance = script:GetCustomProperty("attack_anim_stance"):WaitForObject()
local idle_anim_stance = script:GetCustomProperty("idle_anim_stance"):WaitForObject()
local death_anim_stance = script:GetCustomProperty("death_anim_stance"):WaitForObject()
local damage_reaction_stance = script:GetCustomProperty("damage_reaction_stance"):WaitForObject()

local lastPos = script.parent:GetWorldPosition()
local speed = 0

local STATE_SLEEPING = 0
local STATE_ENGAGING = 1
local STATE_ATTACK_CAST = 2
local STATE_ATTACK_RECOVERY = 3
local STATE_PATROLLING = 4
local STATE_LOOKING_AROUND = 5
local STATE_DEAD_1 = 6
local STATE_DEAD_2 = 7
local STATE_DISABLED = 8

function PlayAttack()

	idle_anim_stance.visibility = Visibility.FORCE_OFF
	run_anim_stance.visibility = Visibility.FORCE_OFF
	damage_reaction_stance.visibility = Visibility.FORCE_OFF
	attack_anim_stance.visibility = Visibility.FORCE_ON

	Task.Wait(0.8)
end

function PlayDeath()
	run_anim_stance.visibility = Visibility.FORCE_OFF
	attack_anim_stance.visibility = Visibility.FORCE_OFF
	idle_anim_stance.visibility = Visibility.FORCE_OFF
	damage_reaction_stance.visibility = Visibility.FORCE_OFF
	death_anim_stance.visibility = Visibility.FORCE_ON

	Task.Wait(1.8)

end

function PlayDamaged()

	idle_anim_stance.visibility = Visibility.FORCE_OFF
	attack_anim_stance.visibility = Visibility.FORCE_OFF
	run_anim_stance.visibility = Visibility.FORCE_OFF	
	damage_reaction_stance.visibility = Visibility.FORCE_ON
	print("playing animation")

	Task.Wait(0.6)

	local state = GetCurrentState()

	if state ~= STATE_ATTACK_CAST and state < STATE_DEAD_1 then
		PlayIdle()
	end

end

function PlayRun()	
	idle_anim_stance.visibility = Visibility.FORCE_OFF
	attack_anim_stance.visibility = Visibility.FORCE_OFF
	damage_reaction_stance.visibility = Visibility.FORCE_OFF
	run_anim_stance.visibility = Visibility.FORCE_ON	
end

function PlayIdle()
	run_anim_stance.visibility = Visibility.FORCE_OFF
	attack_anim_stance.visibility = Visibility.FORCE_OFF
	damage_reaction_stance.visibility = Visibility.FORCE_OFF
	idle_anim_stance.visibility = Visibility.FORCE_ON    
end

function UpdateArt(state)
	if state == STATE_ATTACK_CAST then
		PlayAttack()	
	elseif (state == STATE_DEAD_1) then
		PlayDeath()
	end
end


function GetID()
	if Object.IsValid(ROOT) then
		return ROOT:GetCustomProperty("ObjectId")
	end
	return nil
end

function GetCurrentState()
	if not Object.IsValid(ROOT) then
		return 0
	end
	return ROOT:GetCustomProperty("CurrentState")
end


function OnPropertyChanged(object, propertyName)
	
	if (propertyName == "CurrentState") then
		UpdateArt(GetCurrentState())
	end
end

function OnObjectDamaged(id, prevHealth, dmgAmount, impactPosition, impactRotation, sourceObject)
	local state = GetCurrentState()
	print("damaged")
	if state == STATE_ATTACK_CAST then return end
	if state >= STATE_DEAD_1 then return end
	if speed > WALKING_SPEED then return end

	-- Ignore other NPCs, make sure this event is about this NPC
	if id == GetID() then
		print("playing damage")
		PlayDamaged()
	end
end

function Tick(deltaTime)
	if ROOT:GetCustomProperty("CurrentHealth") <= 0 then return end
	if deltaTime <= 0 then return end
	
	local state = GetCurrentState()
	local pos = script.parent:GetWorldPosition()
	local v = pos - lastPos
	speed = v.size / deltaTime
	
	lastPos = pos

	if speed < WALKING_SPEED and not attack_anim_stance:IsVisibleInHierarchy()
							and not damage_reaction_stance:IsVisibleInHierarchy() then

		PlayIdle()
	
	elseif speed < RUNNING_SPEED and not attack_anim_stance:IsVisibleInHierarchy()
								and not damage_reaction_stance:IsVisibleInHierarchy() then

		PlayRun()

	elseif speed < WALKING_SPEED and attack_anim_stance:IsVisibleInHierarchy()
								and state ~= STATE_ATTACK_CAST then

		PlayIdle()

	elseif speed < RUNNING_SPEED and attack_anim_stance:IsVisibleInHierarchy()
								and state ~= STATE_ATTACK_CAST then

		PlayRun()

	end
end

local damagedListener = Events.Connect("ObjectDamaged", OnObjectDamaged)

function OnDestroyed(obj)
	if damagedListener then
		damagedListener:Disconnect()
		damagedListener = nil
	end
end

ROOT.destroyEvent:Connect(OnDestroyed)
ROOT.networkedPropertyChangedEvent:Connect(OnPropertyChanged)