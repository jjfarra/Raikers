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
    This can be added to an object to make it selectable by leveraging the Modular Interaction System. Just add this
    script to the object in a ClientContext and setup the Custom Properties. Refer to the Interaction System README for
    more details.
--]]

-- Internal Variables
local COMPONENT_ROOT = script:GetCustomProperty("ComponentRoot"):WaitForObject()
local INTERACTION_MODULE = script:GetCustomProperty("APIInteractionModule")
local SUB_TARGET = script:GetCustomProperty("SubTarget"):WaitForObject()
local PRESS_BINDING = script:GetCustomProperty("PressBinding")
local SELECTION_SET = script:GetCustomProperty("SelectionSet")
local SELECT_ON_BEGIN_HOVER = script:GetCustomProperty("SelectOnBeginHover")
local SELECT_ON_END_HOVER = script:GetCustomProperty("SelectOnEndHover")
local SELECT_ON_BEGIN_PRESS = script:GetCustomProperty("SelectOnBeginPress")
local SELECT_ON_END_PRESS = script:GetCustomProperty("SelectOnEndPress")
local SELECT_ON_BEGIN_DRAG_OVER = script:GetCustomProperty("SelectOnBeginDragOver")
local SELECT_ON_END_DRAG_OVER = script:GetCustomProperty("SelectOnEndDragOver")
local SELECT_ON_DROPPED = script:GetCustomProperty("SelectOnDropped")
local DESELECT_ON_BEGIN_HOVER = script:GetCustomProperty("DeselectOnBeginHover")
local DESELECT_ON_END_HOVER = script:GetCustomProperty("DeselectOnEndHover")
local DESELECT_ON_BEGIN_PRESS = script:GetCustomProperty("DeselectOnBeginPress")
local DESELECT_ON_END_PRESS = script:GetCustomProperty("DeselectOnEndPress")
local DESELECT_ON_BEGIN_DRAG_OVER = script:GetCustomProperty("DeselectOnBeginDragOver")
local DESELECT_ON_END_DRAG_OVER = script:GetCustomProperty("DeselectOnEndDragOver")
local DESELECT_ON_DROPPED = script:GetCustomProperty("DeselectOnDropped")
local TOGGLE_ON_BEGIN_HOVER = script:GetCustomProperty("ToggleOnBeginHover")
local TOGGLE_ON_END_HOVER = script:GetCustomProperty("ToggleOnEndHover")
local TOGGLE_ON_BEGIN_PRESS = script:GetCustomProperty("ToggleOnBeginPress")
local TOGGLE_ON_END_PRESS = script:GetCustomProperty("ToggleOnEndPress")
local TOGGLE_ON_BEGIN_DRAG_OVER = script:GetCustomProperty("ToggleOnBeginDragOver")
local TOGGLE_ON_END_DRAG_OVER = script:GetCustomProperty("ToggleOnEndDragOver")
local TOGGLE_ON_DROPPED = script:GetCustomProperty("ToggleOnDropped")

if INTERACTION_MODULE == nil or INTERACTION_MODULE == "" then
    warn(string.format("An Interaction Module must be set on Component: %s (%s)", script.name, script.id))
    return
end

if SELECTION_SET == "" then
    warn(string.format("A Selection Set must be set on Component: %s (%s)", script.name, script.id))
    return
end

local INTERACTION = require(INTERACTION_MODULE)
local LOCAL_PLAYER = Game.GetLocalPlayer()

--[[
    Callbacks
--]]

function OnHoverBegin(position, normal)
    if SELECT_ON_BEGIN_HOVER then
        Select()
    elseif DESELECT_ON_BEGIN_HOVER then
        Deselect()
    elseif TOGGLE_ON_BEGIN_HOVER then
        Toggle()
    end
end

function OnHoverEnd(position, normal)
    if SELECT_ON_END_HOVER then
        Select()
    elseif DESELECT_ON_END_HOVER then
        Deselect()
    elseif TOGGLE_ON_END_HOVER then
        Toggle()
    end
end

function OnPressBegin(binding, position, normal)
    if PRESS_BINDING == "" or PRESS_BINDING == binding then
        if SELECT_ON_BEGIN_PRESS then
            Select()
        elseif DESELECT_ON_BEGIN_PRESS then
            Deselect()
        elseif TOGGLE_ON_BEGIN_PRESS then
            Toggle()
        end
    end
end

function OnPressEnd(binding, position, normal, wasDragging)
    if not wasDragging and (PRESS_BINDING == "" or PRESS_BINDING == binding) then
        if SELECT_ON_END_PRESS then
            Select()
        elseif DESELECT_ON_END_PRESS then
            Deselect()
        elseif TOGGLE_ON_END_PRESS then
            Toggle()
        end
    end
end

function OnDragOverBegin()
    if SELECT_ON_BEGIN_DRAG_OVER then
        Select()
    elseif DESELECT_ON_BEGIN_DRAG_OVER then
        Deselect()
    elseif TOGGLE_ON_BEGIN_DRAG_OVER then
        Toggle()
    end
end

function OnDragOverEnd()
    if SELECT_ON_END_DRAG_OVER then
        Select()
    elseif DESELECT_ON_END_DRAG_OVER then
        Deselect()
    elseif TOGGLE_ON_END_DRAG_OVER then
        Toggle()
    end
end

function OnDropped(position, normal, dropTargetId, ...)
    if SELECT_ON_DROPPED then
        Select()
    elseif DESELECT_ON_DROPPED then
        Deselect()
    elseif TOGGLE_ON_DROPPED then
        Toggle()
    end
end

--[[
    Helper Functions
--]]

function Select()
    INTERACTION.Select(COMPONENT_ROOT, SELECTION_SET, LOCAL_PLAYER)
end

function Deselect()
    INTERACTION.Deselect(COMPONENT_ROOT, SELECTION_SET, LOCAL_PLAYER)
end

function Toggle()
    if INTERACTION.IsSelected(COMPONENT_ROOT, SELECTION_SET, LOCAL_PLAYER) then
        INTERACTION.Deselect(COMPONENT_ROOT, SELECTION_SET, LOCAL_PLAYER)
    else
        INTERACTION.Select(COMPONENT_ROOT, SELECTION_SET, LOCAL_PLAYER)
    end
end

--[[
    Initialization
--]]

local functionTable = {
    HoverBegin = OnHoverBegin,
    HoverEnd = OnHoverEnd,
    PressBegin = OnPressBegin,
    PressEnd = OnPressEnd,
    DragOverBegin = OnDragOverBegin,
    DragOverEnd = OnDragOverEnd,
    Dropped = OnDropped
}

-- Register with the input module. This can fail if any of the parameters are invalid
if not INTERACTION.RegisterTarget(COMPONENT_ROOT, SUB_TARGET, functionTable) then
    warn(string.format("Could not initialize %s (%s)", script.name, script.id))
    return
end

COMPONENT_ROOT.destroyEvent:Connect(INTERACTION.UnregisterTarget)