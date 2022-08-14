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
    This can be added to an object to make it spawn a template by leveraging the Modular Interaction System. Just add
    this script to the object in a ClientContext and setup the Custom Properties. Refer to the Interaction System README
    for more details.

    Note: This does not handle destroying spawned object. If this is meant to spawn temporary objects you should add a
    Lifespan to the template you spawn to avoid a buildup of objects in your scene.
--]]

-- Internal Variables
local COMPONENT_ROOT = script:GetCustomProperty("ComponentRoot"):WaitForObject()
local INTERACTION_MODULE = script:GetCustomProperty("APIInteractionModule")
local SUB_TARGET = script:GetCustomProperty("SubTarget"):WaitForObject()
local SPAWN_TEMPLATE = script:GetCustomProperty("SpawnTemplate")
local SPAWN_CONTAINER = script:GetCustomProperty("SpawnContainer"):WaitForObject()
local SPAWN_OFFSET = script:GetCustomProperty("SpawnOffset")
local PRESS_BINDING = script:GetCustomProperty("PressBinding")
local USE_INPUT_POSITION = script:GetCustomProperty("UseInputNormal")
local USE_INPUT_NORMAL = script:GetCustomProperty("UseInputPosition")
local SPAWN_ON_BEGIN_HOVER = script:GetCustomProperty("SpawnOnBeginHover")
local SPAWN_ON_END_HOVER = script:GetCustomProperty("SpawnOnEndHover")
local SPAWN_ON_BEGIN_PRESS = script:GetCustomProperty("SpawnOnBeginPress")
local SPAWN_ON_END_PRESS = script:GetCustomProperty("SpawnOnEndPress")
local SPAWN_ON_BEGIN_DRAG = script:GetCustomProperty("SpawnOnBeginDrag")
local SPAWN_ON_END_DRAG = script:GetCustomProperty("SpawnOnEndDrag")
local SPAWN_ON_BEGIN_DRAG_OVER = script:GetCustomProperty("SpawnOnBeginDragOver")
local SPAWN_ON_END_DRAG_OVER = script:GetCustomProperty("SpawnOnEndDragOver")
local SPAWN_ON_DROPPED = script:GetCustomProperty("SpawnOnDropped")
local SPAWN_ON_SELECTED = script:GetCustomProperty("SpawnOnSelected")
local SPAWN_ON_DESELECTED = script:GetCustomProperty("SpawnOnDeselected")

if INTERACTION_MODULE == nil or INTERACTION_MODULE == "" then
    warn(string.format("An Interaction Module must be set on Component: %s (%s)", script.name, script.id))
    return
end

local INTERACTION = require(INTERACTION_MODULE)

--[[
    Callbacks
--]]

function OnHoverBegin(position, normal)
    if SPAWN_ON_BEGIN_HOVER then
        SpawnObject(position, normal)
    end
end


function OnHoverEnd(position, normal)
    if SPAWN_ON_END_HOVER then
        SpawnObject(position, normal)
    end
end

function OnPressBegin(binding, position, normal)
    if SPAWN_ON_BEGIN_PRESS and (PRESS_BINDING == "" or PRESS_BINDING == binding) then
        SpawnObject(position, normal)
    end
end

function OnPressEnd(binding, position, normal)
    if SPAWN_ON_END_PRESS and (PRESS_BINDING == "" or PRESS_BINDING == binding) then
        SpawnObject(position, normal)
    end
end

function OnDragOverBegin()
    if SPAWN_ON_BEGIN_DRAG_OVER then
        SpawnObject()
    end
end

function OnDragOverEnd()
    if SPAWN_ON_END_DRAG_OVER then
        SpawnObject()
    end
end

function OnDragBegin(position, normal)
    if SPAWN_ON_BEGIN_DRAG then
        SpawnObject(position, normal)
    end
end

function OnDragEnd(position, normal)
    if SPAWN_ON_END_DRAG then
        SpawnObject(position, normal)
    end
end

function OnDropped(position, normal, dropTargetId, ...)
    if SPAWN_ON_DROPPED then
        SpawnObject(position, normal)
    end
end

function OnSelected(player)
    if SPAWN_ON_SELECTED then
        SpawnObject()
    end
end

function OnDeselected(player)
    if SPAWN_ON_DESELECTED then
        SpawnObject()
    end
end

--[[
    Helper Functions
--]]

function SpawnObject(position, normal)
    local spawnPosition = COMPONENT_ROOT:GetWorldPosition()
    local spawnRotation = COMPONENT_ROOT:GetWorldRotation()

    if USE_INPUT_POSITION and position then
        spawnPosition = position
    end

    if SPAWN_CONTAINER then
        spawnPosition = SPAWN_OFFSET
    else
        spawnPosition = spawnPosition + SPAWN_OFFSET
    end

    if USE_INPUT_NORMAL and normal then
        spawnRotation = Quaternion.New(COMPONENT_ROOT:GetTransform():GetUpVector(), normal):GetRotation()
    end

    World.SpawnAsset(SPAWN_TEMPLATE, { parent = SPAWN_CONTAINER, position = spawnPosition, rotation = spawnRotation })
end

--[[
    Initialization
--]]

if SPAWN_TEMPLATE == "" then
    warn(string.format("SpawnTemplate must be set on %s (%s)", script.name, script.id))
    return
end

local functionTable = {
    HoverBegin = OnHoverBegin,
    HoverEnd = OnHoverEnd,
    PressBegin = OnPressBegin,
    PressEnd = OnPressEnd,
    DragBegin = OnDragBegin,
    DragEnd = OnDragEnd,
    DragOverBegin = OnDragOverBegin,
    DragOverEnd = OnDragOverEnd,
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