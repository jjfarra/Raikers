local trigger = script:GetCustomProperty("Trigger"):WaitForObject()
local sleepingMaskTemplate = script:GetCustomProperty("SleepingMask")

local sleepingMask = nil

local occupant = nil
local maxWalkSpeed = 0
local animationStance = nil
local bindingPressedListener = nil


function Reset()
	occupant = nil
	trigger.interactionLabel = "Sleep"
		
	if bindingPressedListener then
		bindingPressedListener:Disconnect()
		bindingPressedListener = nil
	end
	
	if Object.IsValid(sleepingMask) then
		sleepingMask.visibility = Visibility.FORCE_OFF
		sleepingMask:Detach()
	end
	
	Task.Wait(0.15)
	
	trigger.isInteractable = true
end


function WakeUp()
	if Object.IsValid(occupant) then
		occupant.maxWalkSpeed = maxWalkSpeed
		occupant.animationStance = animationStance
		occupant:DisableRagdoll()
		occupant:SetWorldRotation(trigger:GetWorldRotation())
		
		occupant.serverUserData.isSleepingOnBed = false
	end
	
	Reset()
end


function Sleep(player)
	if player.serverUserData.isSleepingOnBed then return end
	
	occupant = player
	player.serverUserData.isSleepingOnBed = true
	
	--trigger.interactionLabel = "Wake Up"
	
	player:ResetVelocity()
	maxWalkSpeed = player.maxWalkSpeed
	animationStance = player.animationStance
	player.maxWalkSpeed = 0
	
	trigger.isInteractable = false
	
	Task.Wait(0.15)
	
	if Object.IsValid(player) then
		player:ResetVelocity()
		player:SetWorldPosition(script:GetWorldPosition() + Vector3.UP * 110)
		player:SetWorldRotation(script:GetWorldRotation())

		player.animationStance = "unarmed_sit_car_low"
				
		Task.Wait(0.2)
		
		if Object.IsValid(player) then
			player:EnableRagdoll()--"pelvis", 1)
		
			bindingPressedListener = player.bindingPressedEvent:Connect(OnBindingPressed)
			
			if (not Object.IsValid(sleepingMask)) then
				sleepingMask = World.SpawnAsset(sleepingMaskTemplate)
			end
			sleepingMask.visibility = Visibility.FORCE_ON
			sleepingMask:AttachToPlayer(player, "head")

		else
			Reset()
		end
		
	else
		Reset()
	end
	
	--trigger.isInteractable = true
end


function OnBindingPressed(player, action)
	if action == "ability_extra_17" then
		WakeUp()
	end
end


function OnInteracted(trigger, player)
	if occupant == nil then
		Sleep(player)

	elseif occupant == player then
		WakeUp()
	end
end


function OnEndOverlap(trigger, player)
	if occupant == player and trigger.isInteractable then
		WakeUp()
	end
end

trigger.interactedEvent:Connect(OnInteracted)
trigger.endOverlapEvent:Connect(OnEndOverlap)


function OnPlayerLeft(player)
	if occupant == player then
		Reset()
	end
end

Game.playerLeftEvent:Connect(OnPlayerLeft)

