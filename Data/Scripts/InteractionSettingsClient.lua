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
    This is an optional script that allows you to set some parameters on the modular input system. Just place one copy
    into a ClientContext and configure the Custom Properties.
--]]

-- Internal Variables
local COMPONENT_ROOT = script:GetCustomProperty("ComponentRoot"):WaitForObject()

---@type APIInteractionManager
local INTERACTION = require(script:GetCustomProperty("APIInteractionModule"))

local DRAG_UI_CONTAINER = COMPONENT_ROOT:GetCustomProperty("CursorModule_DragUIContainer"):WaitForObject()
local LOOK_DISTANCE = COMPONENT_ROOT:GetCustomProperty("LookModule_Distance")
local LOOK_SIZE = COMPONENT_ROOT:GetCustomProperty("LookModule_SelectionSize")
local TRIGGER_ONLY_LOCAL_PLAYER = COMPONENT_ROOT:GetCustomProperty("TriggerModule_OnlyLocalPlayer")
local CAMERA_DISTANCE = COMPONENT_ROOT:GetCustomProperty("CameraModule_Distance")
local CAMERA_SIZE = COMPONENT_ROOT:GetCustomProperty("CameraModule_SelectionSize")
local SHOW_DEBUG = COMPONENT_ROOT:GetCustomProperty("ShowDebug")

-- Private Variables
local settings = {}
local dragUIContainer
local lookDistance = 2000
local lookSize = 50
local cameraDistance = 2000
local cameraSize = 50

if DRAG_UI_CONTAINER then
    dragUIContainer = DRAG_UI_CONTAINER
end

if LOOK_DISTANCE then
    if LOOK_DISTANCE > 0 then
        lookDistance = LOOK_DISTANCE
    else
        warn("LookModule_Distance must be greater than 0")
    end
end

if LOOK_SIZE then
    if LOOK_SIZE > 0 then
        lookSize = LOOK_SIZE
    else
        warn("LookModule_SelectionSize must be greater than 0")
    end
end

if CAMERA_DISTANCE then
    if CAMERA_DISTANCE > 0 then
        cameraDistance = CAMERA_DISTANCE
    else
        warn("CameraModule_Distance must be greater than 0")
    end
end

if CAMERA_SIZE then
    if CAMERA_SIZE > 0 then
        cameraSize = CAMERA_SIZE
    else
        warn("CameraModule_SelectionSize must be greater than 0")
    end
end

settings[INTERACTION.Setting.LookDistance] = lookDistance
settings[INTERACTION.Setting.LookSize] = lookSize
settings[INTERACTION.Setting.TriggerLocally] = TRIGGER_ONLY_LOCAL_PLAYER
settings[INTERACTION.Setting.CameraDistance] = cameraDistance
settings[INTERACTION.Setting.CameraSize] = cameraSize
settings[INTERACTION.Setting.ShowDebug] = SHOW_DEBUG
settings[INTERACTION.Setting.DragUIContainer] = dragUIContainer

INTERACTION.RegisterSettings(settings)