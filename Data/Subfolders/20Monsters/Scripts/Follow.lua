local targetPlayer = nil

function Tick(deltaTime)
    if    targetPlayer == nil then
        targetPlayer = Game.FindNearestPlayer(script:GetWorldPosition())
        if targetPlayer ~= nil then
            UI.PrintToScreen("Aquired Target Player: " .. targetPlayer.name)
            script.parent:Follow(targetPlayer,200)
            script.parent:LookAtContinuous(targetPlayer,true)
        end
    end
end
