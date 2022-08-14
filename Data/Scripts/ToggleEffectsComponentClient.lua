--[[
Copyright 2021 Manticore Games, Inc. 

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated
documentation files (the "Software"), to deal in the Software without restriction, including without limitation the
rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit
persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the
Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE
WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR
OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
--]]

--[[
    This can be added to an object to make it play Audio or Vfx by leveraging the Modular Interaction System. Just add
    this script to the object in a ClientContext and setup the Custom Properties. Please refer to the Interaction System
    README for more details.

    Note: Effects can either be an Audio/Vfx object or a group containing 1 or more Audio/Vfx objects. This will play
    every effect it finds in that group.
--]]

-- Internal Variables
local COMPONENT_ROOT = script:GetCustomProperty("ComponentRoot"):WaitForObject()
local INTERACTION_MODULE = script:GetCustomProperty("APIInteractionModule")
local SUB_TARGET = script:GetCustomProperty("SubTarget"):WaitForObject()
local EFFECTS = script:GetCustomProperty("Effects"):WaitForObject()
local PRESS_BINDING = script:GetCustomProperty("PressBinding")
local PLAY_ON_BEGIN_HOVER = script:GetCustomProperty("PlayOnBeginHover")
local PLAY_ON_END_HOVER = script:GetCustomProperty("PlayOnEndHover")
local PLAY_ON_BEGIN_PRESS = script:GetCustomProperty("PlayOnBeginPress")
local PLAY_ON_END_PRESS = script:GetCustomProperty("PlayOnEndPress")
local PLAY_ON_BEGIN_DRAG_OVER = script:GetCustomProperty("PlayOnBeginDragOver")
local PLAY_ON_END_DRAG_OVER = script:GetCustomProperty("PlayOnEndDragOver")
local PLAY_ON_BEGIN_DRAG = script:GetCustomProperty("PlayOnBeginDrag")
local PLAY_ON_END_DRAG = script:GetCustomProperty("PlayOnEndDrag")
local PLAY_ON_DROPPED = script:GetCustomProperty("PlayOnDropped")
local PLAY_ON_SELECTED = script:GetCustomProperty("PlayOnSelected")
local PLAY_ON_DESELECTED = script:GetCustomProperty("PlayOnDeselected")
local STOP_ON_BEGIN_HOVER = script:GetCustomProperty("StopOnBeginHover")
local STOP_ON_END_HOVER = script:GetCustomProperty("StopOnEndHover")
local STOP_ON_BEGIN_PRESS = script:GetCustomProperty("StopOnBeginPress")
local STOP_ON_END_PRESS = script:GetCustomProperty("StopOnEndPress")
local STOP_ON_BEGIN_DRAG_OVER = script:GetCustomProperty("StopOnBeginDragOver")
local STOP_ON_END_DRAG_OVER = script:GetCustomProperty("StopOnEndDragOver")
local STOP_ON_BEGIN_DRAG = script:GetCustomProperty("StopOnBeginDrag")
local STOP_ON_END_DRAG = script:GetCustomProperty("StopOnEndDrag")
local STOP_ON_DROPPED = script:GetCustomProperty("StopOnDropped")
local STOP_ON_SELECTED = script:GetCustomProperty("StopOnSelected")
local STOP_ON_DESELECTED = script:GetCustomProperty("StopOnDeselected")
local TOGGLE_ON_BEGIN_HOVER = script:GetCustomProperty("ToggleOnBeginHover")
local TOGGLE_ON_END_HOVER = script:GetCustomProperty("ToggleOnEndHover")
local TOGGLE_ON_BEGIN_PRESS = script:GetCustomProperty("ToggleOnBeginPress")
local TOGGLE_ON_END_PRESS = script:GetCustomProperty("ToggleOnEndPress")
local TOGGLE_ON_BEGIN_DRAG_OVER = script:GetCustomProperty("ToggleOnBeginDragOver")
local TOGGLE_ON_END_DRAG_OVER = script:GetCustomProperty("ToggleOnEndDragOver")
local TOGGLE_ON_BEGIN_DRAG = script:GetCustomProperty("ToggleOnBeginDrag")
local TOGGLE_ON_END_DRAG = script:GetCustomProperty("ToggleOnEndDrag")
local TOGGLE_ON_DROPPED = script:GetCustomProperty("ToggleOnDropped")
local TOGGLE_ON_SELECTED = script:GetCustomProperty("ToggleOnSelected")
local TOGGLE_ON_DESELECTED = script:GetCustomProperty("ToggleOnDeselected")

if INTERACTION_MODULE == nil or INTERACTION_MODULE == "" then
    warn(string.format("An Interaction Module must be set on Component: %s (%s)", script.name, script.id))
    return
end

local INTERACTION = require(INTERACTION_MODULE)

-- Private Variables
local allEffects = {}

--[[
    Callbacks
--]]

function OnHoverBegin(position, normal)
    if PLAY_ON_BEGIN_HOVER then
        PlayEffects()
    elseif STOP_ON_BEGIN_HOVER then
        StopEffects()
    elseif TOGGLE_ON_BEGIN_HOVER then
        ToggleEffects()
    end
end

function OnHoverEnd(position, normal)
    if PLAY_ON_END_HOVER then
        PlayEffects()
    elseif STOP_ON_END_HOVER then
        StopEffects()
    elseif TOGGLE_ON_END_HOVER then
        ToggleEffects()
    end
end

function OnPressBegin(binding, position, normal)
    if PRESS_BINDING == "" or PRESS_BINDING == binding then
        if PLAY_ON_BEGIN_PRESS then
            PlayEffects()
        elseif STOP_ON_BEGIN_PRESS then
            StopEffects()
        elseif TOGGLE_ON_BEGIN_PRESS then
            ToggleEffects()
        end
    end
end

function OnPressEnd(binding, position, normal, wasDragging)
    if PRESS_BINDING == "" or PRESS_BINDING == binding then
        if PLAY_ON_END_PRESS then
            PlayEffects()
        elseif STOP_ON_END_PRESS then
            StopEffects()
        elseif TOGGLE_ON_END_PRESS then
            ToggleEffects()
        end
    end
end

function OnDragOverBegin()
    if PLAY_ON_BEGIN_DRAG_OVER then
        PlayEffects()
    elseif STOP_ON_BEGIN_DRAG_OVER then
        StopEffects()
    elseif TOGGLE_ON_BEGIN_DRAG_OVER then
        ToggleEffects()
    end
end

function OnDragOverEnd()
    if PLAY_ON_END_DRAG_OVER then
        PlayEffects()
    elseif STOP_ON_END_DRAG_OVER then
        StopEffects()
    elseif TOGGLE_ON_END_DRAG_OVER then
        ToggleEffects()
    end
end

function OnDragBegin(position, normal)
    if PLAY_ON_BEGIN_DRAG then
        PlayEffects()
    elseif STOP_ON_BEGIN_DRAG then
        StopEffects()
    elseif TOGGLE_ON_BEGIN_DRAG then
        ToggleEffects()
    end
end

function OnDragEnd(position, normal)
    if PLAY_ON_END_DRAG then
        PlayEffects()
    elseif STOP_ON_END_DRAG then
        StopEffects()
    elseif TOGGLE_ON_END_DRAG then
        ToggleEffects()
    end
end

function OnDropped(position, normal, dropTargetId, ...)
    if PLAY_ON_DROPPED then
        PlayEffects()
    elseif STOP_ON_DROPPED then
        StopEffects()
    elseif TOGGLE_ON_DROPPED then
        ToggleEffects()
    end
end

function OnSelected()
    if PLAY_ON_SELECTED then
        PlayEffects()
    elseif STOP_ON_SELECTED then
        StopEffects()
    elseif TOGGLE_ON_SELECTED then
        ToggleEffects()
    end
end

function OnDeselected()
    if PLAY_ON_DESELECTED then
        PlayEffects()
    elseif STOP_ON_DESELECTED then
        StopEffects()
    elseif TOGGLE_ON_DESELECTED then
        ToggleEffects()
    end
end

--[[
    Helper Functions
--]]

function SetupEffects()
    AddEffects(EFFECTS)
    return #allEffects > 0
end

function AddEffects(object)
    if object:IsA("Audio") then
        table.insert(allEffects, object)
    end

    if object:IsA("Vfx") then
        table.insert(allEffects, object)
    end

    for _, child in ipairs(object:GetChildren()) do
        AddEffects(child)
    end
end

function StopEffects()
    for _, effect in ipairs(allEffects) do
        if Object.IsValid(effect) then
            effect:Stop()
        end
    end
end

function PlayEffects()
    for _, effect in ipairs(allEffects) do
        if Object.IsValid(effect) then
            effect:Play()
        end
    end
end

function ToggleEffects()
    for _, effect in ipairs(allEffects) do
        if Object.IsValid(effect) then
            if effect.isPlaying then
                effect:Stop()
            else
                effect:Play()
            end
        end
    end
end

--[[
    Initialization
--]]

if not EFFECTS then
    warn(string.format("Effects must be set on %s (%s)", script.name, script.id))
    return
end

if not SetupEffects() then
    warn(string.format("There must be at least one Audio or Vfx object set on %s (%s)", script.name, script.id))
    return
end

local functionTable = {
    HoverBegin = OnHoverBegin,
    HoverEnd = OnHoverEnd,
    PressBegin = OnPressBegin,
    PressEnd = OnPressEnd,
    DragOverBegin = OnDragOverBegin,
    DragOverEnd = OnDragOverEnd,
    DragBegin = OnDragBegin,
    DragEnd = OnDragEnd,
    Dropped = OnDropped,
    Selected = OnSelected,
    Deselected = OnDeselected
}

-- Register with the input module. This can fail if any of the parameters are invalid
if not INTERACTION.RegisterTarget(COMPONENT_ROOT, SUB_TARGET, functionTable) then
    warn(string.format("Could not initialize %s (%s)", script.name, script.id))
    return
end

COMPONENT_ROOT.destroyEvent:Connect(INTERACTION.UnregisterTarget)