local ROOT = script:GetCustomProperty("Root"):WaitForObject()
local TRIGGER = script:GetCustomProperty("Trigger"):WaitForObject()
local INDICATOR_ASSET = script:GetCustomProperty("DialogIndicator")

-- User exposed properties
local NAME = ROOT:GetCustomProperty("Name")
local START_DIALOGUE_ID = ROOT:GetCustomProperty("StartDialogId")
local ANIMATED_MESH = ROOT:GetCustomProperty("AnimatedMesh")
local DEFAULT_ANIMATION = ROOT:GetCustomProperty("DefaultLoopAnimation")
local PLAY_ANIMATIONS = ROOT:GetCustomProperty("PlayDialogAnimations")

if ANIMATED_MESH ~= nil then
    ANIMATED_MESH = ROOT:GetCustomProperty("AnimatedMesh"):WaitForObject(1)
end

-- Constants
local LOCAL_PLAYER = Game.GetLocalPlayer()
local DEFAULT_ROTATION = Vector3.ZERO
local ROTATE_SPEED = .5
local INDICATOR_OFFSET = 150

if Object.IsValid(ANIMATED_MESH) then
    DEFAULT_ROTATION = ANIMATED_MESH:GetWorldRotation()
end

local indicatorInstance = nil

function Tick()
    if not TRIGGER.isInteractable and not UI.IsCursorVisible() then
        TRIGGER.isInteractable = true
        if PLAY_ANIMATIONS then
            NPCPlayLoopAnimation()
            NPCResetRotation()
        end
    end
end

function NPCPlayLoopAnimation()
    if Object.IsValid(ANIMATED_MESH) then
        if DEFAULT_ANIMATION ~= "" then
            ANIMATED_MESH:PlayAnimation(DEFAULT_ANIMATION, {shouldLoop = true})
        end
        TriggerDialogIndicator(true)
    end
end

function NPCStopLoopAnimation()
    if Object.IsValid(ANIMATED_MESH) then
        ANIMATED_MESH:StopAnimations()
        TriggerDialogIndicator(false)
    end
end

function NPCRotateToPlayer()
    if Object.IsValid(ANIMATED_MESH) then
        ANIMATED_MESH:LookAtContinuous(LOCAL_PLAYER, true, ROTATE_SPEED * 5)
    end
    
end

function NPCResetRotation()
    if Object.IsValid(ANIMATED_MESH) then
        ANIMATED_MESH:RotateTo(DEFAULT_ROTATION, ROTATE_SPEED)
    end
end

function TriggerDialogIndicator(trigger)
    if not Object.IsValid(indicatorInstance) then return end
    if trigger then
        indicatorInstance.visibility = Visibility.INHERIT
    else
        indicatorInstance.visibility = Visibility.FORCE_OFF
    end
end

function OnInteracted(whichTrigger, other)
    if other:IsA("Player") then
        if Object.IsValid(ANIMATED_MESH) and PLAY_ANIMATIONS then
            Events.Broadcast("StartDialog", NAME, START_DIALOGUE_ID, ANIMATED_MESH.id)
            NPCRotateToPlayer()
            NPCStopLoopAnimation()
        else
            Events.Broadcast("StartDialog", NAME, START_DIALOGUE_ID)
        end
        TRIGGER.isInteractable = false
	end
end

-- Initialize
if NAME ~= "" then
    TRIGGER.interactionLabel = "Talk to ".. NAME
end
TRIGGER.interactedEvent:Connect(OnInteracted)

if PLAY_ANIMATIONS then
    NPCPlayLoopAnimation()
end

if INDICATOR_ASSET and Object.IsValid(ANIMATED_MESH) then
    indicatorInstance = World.SpawnAsset(INDICATOR_ASSET, {position = ANIMATED_MESH:GetWorldPosition() + Vector3.UP * INDICATOR_OFFSET})
    indicatorInstance:LookAtContinuous(LOCAL_PLAYER, true)
end
