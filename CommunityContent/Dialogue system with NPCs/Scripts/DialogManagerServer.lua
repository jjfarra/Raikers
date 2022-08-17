function OnDialogResourceReward (player, resource)
    if Object.IsValid(player) then
        print(player:GetResource(resource))
        player:AddResource(resource, 1)
    end
end

Events.ConnectForPlayer("DialogResourceReward", OnDialogResourceReward)