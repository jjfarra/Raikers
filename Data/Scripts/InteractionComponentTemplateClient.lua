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
    This is a template showing all of the available callbacks you can use with the Modular Interaction System. If a
    callback has been registered with the Input Manager it will be called at the appropriate time. This lets you only
    register the callbacks you care about. Refer to Interaction System README for more details.
--]]

-- Internal Variables
local COMPONENT_ROOT = script:GetCustomProperty("ComponentRoot"):WaitForObject()
local INTERACTION_MODULE = script:GetCustomProperty("APIInteractionModule")
local SUB_TARGET = script:GetCustomProperty("SubTarget"):WaitForObject()
local PRESS_BINDING = script:GetCustomProperty("PressBinding")

-- Valid input modules are APICursorInteractionModule, APITriggerInteractionModule, APIPointerInteractionModule and
-- APILookInteractionModule
if INTERACTION_MODULE == nil or INTERACTION_MODULE == "" then
    warn(string.format("An Interaction Module must be set on Component: %s (%s)", script.name, script.id))
    return
end

local INTERACTION = require(INTERACTION_MODULE)

--[[
    Optional API Functions
--]]

---Called when the registered target is hovered over by the selected input module.
---@param position Vector3 The position of the input
---@param normal Vector3 The normal of the input
function OnHoverBegin(position, normal)
    print(string.format("OnHoverBegin, position = %s, normal = %s", position, normal))
end

---Called each frame while the registered target is being hovered over by the selected input module.
---@param position Vector3 The position of the input
---@param normal Vector3 The normal of the input
function OnHover(position, normal)
    print(string.format("OnHover, position = %s, normal = %s", position, normal))
end

---Called when the registered target is no longer hovered over by the selected input module.
---@param position Vector3 The position of the input
---@param normal Vector3 The normal of the input
---@param wasDragging boolean True if the target was being dragged when the hover ended
function OnHoverEnd(position, normal, wasDragging)
    print(string.format("OnHoverEnd, position = %s, normal = %s, wasDragging = %s", position, normal, wasDragging))
end

---Called when any binding is pressed while the registered target is being hovered over. This can also be forced.
---@param binding string The binding associated with the press
---@param position Vector3 The position of the input
---@param normal Vector3 The normal of the input
function OnPressBegin(binding, position, normal)
    -- Since this is called every time a binding is pressed we need to compare it against the PRESS_BINDING
    if PRESS_BINDING == "" or PRESS_BINDING == binding then
        print(string.format("OnPressBegin, binding = %s, position = %s, normal = %s", binding, position, normal))
    end
end

---Called when any binding is released while the registered target is being hovered over. This can also be forced.
---@param binding string The binding associated with the press
---@param position Vector3 The position of the input
---@param normal Vector3 The normal of the input
---@param wasDragging boolean True if the target was being dragged when the press ended
function OnPressEnd(binding, position, normal, wasDragging)
    if not wasDragging and (PRESS_BINDING == "" or PRESS_BINDING == binding) then
        print(string.format("OnPressEnd, binding = %s, position = %s, normal = %s, wasDragging = %s", binding, position, normal, wasDragging))
    end
end

---Called when another object is dragged over this one.
function OnDragOverBegin()
    print("OnDragOverBegin")
end

---Called when another object is dragged away from this one.
function OnDragOverEnd()
    print("OnDragOverEnd")
end

---Called when the registered target starts being dragged.
---@param position Vector3 The position of the input
---@param normal Vector3 The normal of the input
function OnDragBegin(position, normal)
    print(string.format("OnDragBegin, position = %s, normal = %s", position, normal))
end

---Called when the registered target stops being dragged.
---@param position Vector3 The position of the input
---@param normal Vector3 The normal of the input
function OnDragEnd(position, normal)
    print(string.format("OnDragEnd, position = %s, normal = %s", position, normal))
end

---Called when the registered target is dropped. Data for the object it was dropped on will be provided if SetDropTargetData() was called on the object.
---@param position Vector3 The position of the input
---@param normal Vector3 The normal of the input
---@param dropTargetId string|nil The Drop Target this was dropped on, if one exists
function OnDropped(position, normal, dropTargetId, ...)
    print(string.format("OnDropped, position = %s, normal = %s, dropTargetId = %s, data = ", position, normal, dropTargetId), ...)
end

---Called when the registered target is selected.
function OnSelected()
    print("OnSelected")
end

---Called when the registered target is deselected.
function OnDeselected()
    print("OnDeselected")
end

---Called when data is being set on a component. The component may be nil which means the data is meant for all components.
---@param component CoreObject The target component to set the data on
function OnSetData(component, ...)
    print(string.format("OnSetData, component = %s, data = ", component or "nil"), ...)
end

--[[
    Initialization
--]]

-- The callbacks to be registered for this component
local functionTable = {
    HoverBegin = OnHoverBegin,
    Hover = OnHover,
    HoverEnd = OnHoverEnd,
    PressBegin = OnPressBegin,
    PressEnd = OnPressEnd,
    DragOverBegin = OnDragOverBegin,
    DragOverEnd = OnDragOverEnd,
    DragBegin = OnDragBegin,
    DragEnd = OnDragEnd,
    Dropped = OnDropped,
    Selected = OnSelected,
    Deselected = OnDeselected,
    SetData = OnSetData
}

-- Register with the input module. This can fail if any of the parameters are invalid
if not INTERACTION.RegisterTarget(COMPONENT_ROOT, SUB_TARGET, functionTable) then
    warn(string.format("Could not initialize %s (%s)", script.name, script.id))
    return
end

-- Automatically unregister this target if it is destroyed
COMPONENT_ROOT.destroyEvent:Connect(INTERACTION.UnregisterTarget)