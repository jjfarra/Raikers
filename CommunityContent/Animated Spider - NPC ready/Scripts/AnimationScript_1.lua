--[[

    AnimationScript
    v 1.0
    By PiousLachance(Gabriele)

    Animate an ANIMATION state of an object making it pass through many static states
    Can also spawn a template at the beginning or at the end of a user-defined state

]]

-- PROPERTY VARIABLES
-- frame variables
local toAnim = script:GetCustomProperty("toAnim"):WaitForObject()
local animTime = script:GetCustomProperty("animTime")
local statePieces = script:GetCustomProperty("statePieces")
local isInside = script:GetCustomProperty("isInside")
local isOnce = script:GetCustomProperty("isOnce")
local isRandom = script:GetCustomProperty("isRandom")
local naturalLook = script:GetCustomProperty("naturalLook")

-- template spawn variables
local template = script:GetCustomProperty("Template")
local templateSpawn = script:GetCustomProperty("TemplateSpawn"):WaitForObject()
local templateSpawnAdjustment = script:GetCustomProperty("TemplateSpawnAdjustment")
local templateSpawnState = script:GetCustomProperty("TemplateSpawnState")
local templateSpawnBefore_After = script:GetCustomProperty("TemplateSpawnBefore_After")


-- LOCAL VARIABLES
local set = false
local states = {}
local animation
local animationPieces = {}

math.randomseed( os.time() )
local rand = math.random

local animStateNum = 1

----------------------------------------------------------------------------------------------

-- INTERNAL FUNCTION (used just to tidy it up a bit)
function TemplateSpawnBefore(main)

    -- Before == true
    -- controllo che ci sia una template immessa, altrimenti salto
    if template ~= nil and templateSpawnBefore_After then
        if templateSpawnState == main.name then
            World.SpawnAsset(template, {position = (templateSpawn:GetWorldPosition() 
                                                    + templateSpawnAdjustment)})
        end
    end
end

function TemplateSpawnAfter(main)
    
    -- After == false
    -- controllo che ci sia una template immessa, altrimenti salto
    if template ~= nil and not templateSpawnBefore_After then
        if templateSpawnState == main.name then
            World.SpawnAsset(template, {position = (templateSpawn:GetWorldPosition() 
                                                    + templateSpawnAdjustment)})
        end
    end
end

--------------------------------------------------------------------------------------------

function Tick()

    if not set then

        Task.Wait(naturalLook)
        
        -- Set the states
        Set()
    end

    

    -- Move the animation
    
    if toAnim:IsVisibleInHierarchy() then

        Move()

    end

    

end

function Set()

    --------------------------------------------
    -- take all the states of the animation
    states = toAnim:GetChildren()

    --------------------------------------------

    for i,t in pairs (states) do

        if isInside then 

            -- take away the script if it's inside the folder of the animation ( just a insurance )
            if t:IsA("Script") and t.name == "AnimationScript" then
                
                table.remove(states, i)
                t = states[i]
            end
        end 

        ----------------------------------------

        if t.name == "ANIMATION" then
            
            -- make a special state for the animation that will actually move between the states
            -- REMEMBER TO NETWORK IT !
            animation = toAnim:FindDescendantByName("ANIMATION")
            for j = 1,statePieces do
                animationPieces[j] = animation:FindDescendantByName(tostring(j))
            end
            table.remove(states, i)
            break
        end

        -----------------------------------------

        -- add pieces to the states 
        states[i] = {}
        states[i][0] = t
        for j = 1,statePieces do  
            states[i][j] = t:FindDescendantByName(tostring(j))
        end

        print("SET :", states[i][0].name)

    end

    -----------------------------------------------

    -- all set !
    set = true

end

function Move()

    if not isRandom and not isOnce then

        for i,t in pairs (states) do

            local main = states[i][0]

            TemplateSpawnBefore(main)

            --print("State ", main.name)
            --print("Rotation ", main:GetRotation())
            animation:RotateTo(main:GetRotation(), animTime, true)
            animation:MoveTo(main:GetPosition(), animTime, true)
            animation:ScaleTo(main:GetScale(), animTime, true)

            for j = 1,statePieces do
                --print("Piece Rotation ",states[i][j]:GetRotation())
                animationPieces[j]:RotateTo(states[i][j]:GetRotation(), animTime, true)
                animationPieces[j]:MoveTo(states[i][j]:GetPosition(), animTime, true)
                animationPieces[j]:ScaleTo(states[animStateNum][j]:GetScale(), animTime, true)
            end

            Task.Wait(animTime)

            TemplateSpawnAfter(main)

        end

        -------------------------------------------------------

    elseif isRandom and not isOnce then

        local rNumber = rand(3)
        
        if rNumber == 1 then

            if animStateNum > 1 then
                animStateNum = animStateNum - 1
            end 

        elseif rNumber == 3 then

            if animStateNum < #states then
                animStateNum = animStateNum + 1
            end

        end
        

        local main = states[animStateNum][0]

        TemplateSpawnBefore(main)

        --print("State ", main.name)
        --print("Rotation ", main:GetRotation())
        animation:RotateTo(main:GetRotation(), animTime, true)
        animation:MoveTo(main:GetPosition(), animTime, true)
        animation:ScaleTo(main:GetScale(), animTime, true)

        for j = 1,statePieces do
            --print("Piece Rotation ",states[rNumber][j]:GetRotation())
            animationPieces[j]:RotateTo(states[animStateNum][j]:GetRotation(), animTime, true)
            animationPieces[j]:MoveTo(states[animStateNum][j]:GetPosition(), animTime, true)
            animationPieces[j]:ScaleTo(states[animStateNum][j]:GetScale(), animTime, true)
        end

        Task.Wait(animTime)

        TemplateSpawnAfter(main)

        -----------------------------------------------------------------

    elseif not isRandom and isOnce then

        local lastState = #states
        local i = 1

        local main = states[i][0]

        TemplateSpawnBefore(main)

        --print("State ", main.name, " @ ", i)
        --print("Rotation ", main:GetRotation())
        animation:RotateTo(main:GetRotation(), animTime, true)
        animation:MoveTo(main:GetPosition(), animTime, true)
        animation:ScaleTo(main:GetScale(), animTime, true)

        for j = 1,statePieces do
            --print("Piece Rotation ",states[i][j]:GetRotation())
            animationPieces[j]:RotateTo(states[i][j]:GetRotation(), animTime, true)
            animationPieces[j]:MoveTo(states[i][j]:GetPosition(), animTime, true)
            animationPieces[j]:ScaleTo(states[animStateNum][j]:GetScale(), animTime, true)
        end

        if i ~= lastState then
            
            table.remove(states, i)
        end

        Task.Wait(animTime)

        TemplateSpawnAfter(main)

        ------------------------------------------------------------------

    elseif isRandom and isOnce then

        local rNumber = rand(3)
        local i = 1
        
        if rNumber == 1 then

            if animStateNum > 1 then
                animStateNum = animStateNum - 1
            end 

        elseif rNumber == 3 then

            if animStateNum < #states then
                animStateNum = animStateNum + 1
            end

        end
        
        local lastState = #states
        local main = states[animStateNum][0]

        TemplateSpawnBefore(main)

        --print("State ", main.name)
        --print("Rotation ", main:GetRotation())
        animation:RotateTo(main:GetRotation(), animTime, true)
        animation:MoveTo(main:GetPosition(), animTime, true)
        animation:ScaleTo(main:GetScale(), animTime, true)

        for j = 1,statePieces do
            --print("Piece Rotation ",states[rNumber][j]:GetRotation())
            animationPieces[j]:RotateTo(states[animStateNum][j]:GetRotation(), animTime, true)
            animationPieces[j]:MoveTo(states[animStateNum][j]:GetPosition(), animTime, true)
            animationPieces[j]:ScaleTo(states[animStateNum][j]:GetScale(), animTime, true)
        end

        if i ~= lastState then
            
            table.remove(states[i])
        end

        Task.Wait(animTime)

        TemplateSpawnAfter(main)

        --------------------------------------------------------------------
        
    end

end