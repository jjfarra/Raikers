local propWaterSound = script:GetCustomProperty("WaterSound"):WaitForObject()
local propTrigger = script:GetCustomProperty("Trigger"):WaitForObject()
local propWaterJump = script:GetCustomProperty("WaterJump"):WaitForObject()



function OnBeginOverlap(propTrigger, other)
	if other:IsA("Player") then
	
	propWaterJump:Play()
		
		end
end
propTrigger.beginOverlapEvent:Connect(OnBeginOverlap)

   
while true do
    Task.Wait(1)
    local allPlayers = Game.GetPlayers()

    for _, player in ipairs(allPlayers) do
        if propTrigger:IsOverlapping(player) then
     if player.isAccelerating then           								
	propWaterSound:Play()
	
	end
	end        
        
end     		
	                		                       
end

propTrigger.beginOverlapEvent:Connect(OnBeginOverlap)   


