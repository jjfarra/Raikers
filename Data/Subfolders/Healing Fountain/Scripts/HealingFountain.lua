
local TRIGGER = script:GetCustomProperty("Trigger"):WaitForObject()
local HITPOINTS_PER_SECOND = script:GetCustomProperty("HitPointsPerSecond")
local PERIOD = 2

local activePlayers = {}


function Tick()
	Task.Wait(PERIOD)
	
	for _,player in ipairs(activePlayers) do
		if Object.IsValid(player) then
			if player.hitPoints < player.maxHitPoints then
				local amountHealed = HITPOINTS_PER_SECOND * PERIOD
				if player.isCrouching then
					amountHealed = amountHealed * 1.2
				end
				
				local newHP = player.hitPoints + amountHealed
				if newHP > player.maxHitPoints then
					newHP = player.maxHitPoints
				end
				
				amountHealed = newHP - player.hitPoints
				player.hitPoints = newHP
				
				Events.BroadcastToAllPlayers("PlayerHealed", player, amountHealed)
			end
		end
	end
end

function OnBeginOverlap(theTrigger, player)
    if player and player:IsA("Player") then
        table.insert(activePlayers, player)
    end
end

function OnEndOverlap(theTrigger, player)
    if (not player or not player:IsA("Player")) then return end

    for i,p in ipairs(activePlayers) do
        if (p == player) then
            table.remove(activePlayers, i)
            break
        end
    end
end

TRIGGER.beginOverlapEvent:Connect(OnBeginOverlap)
TRIGGER.endOverlapEvent:Connect(OnEndOverlap)