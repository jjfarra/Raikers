--[[
Copyright 2020 Manticore Games, Inc.

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

-- Internal custom properties
local API = require(script:GetCustomProperty("APIDialogsLibrary"))
local ROOT = script:GetCustomProperty("Root"):WaitForObject()
local LIBRARY_COLLECTION = script:GetCustomProperty("LibraryCollection"):WaitForObject()
local DIALOG_TEXT = script:GetCustomProperty("DialogText"):WaitForObject()
local INSTRUCTION_TEXT = script:GetCustomProperty("InstructionText"):WaitForObject()
local NAME_TEXT = script:GetCustomProperty("NameText"):WaitForObject()
local PANEL = script:GetCustomProperty("Panel"):WaitForObject()
local OPTIONS_PANEL = script:GetCustomProperty("OptionsPanel"):WaitForObject()
local REWARD_PANEL = script:GetCustomProperty("ResourceRewardPanel"):WaitForObject()
local REWARD_TEXT = script:GetCustomProperty("ResourceRewardText"):WaitForObject()
local HELPER = script:GetCustomProperty("Helper")

-- User exposed properties
local PRINT_TEXT_DELAY = ROOT:GetCustomProperty("PrintTextDelay")
local PLAYER_PROMPT_DELAY = ROOT:GetCustomProperty("PlayerPromptDelay")
local PLAY_PRINT_SOUND = ROOT:GetCustomProperty("PlayPrintSound")
local PRINT_SOUND = ROOT:GetCustomProperty("PrintSound"):WaitForObject()
local CLICK_SOUND = ROOT:GetCustomProperty("ClickSound"):WaitForObject()
local REWARD_SOUND = ROOT:GetCustomProperty("RewardSound"):WaitForObject()

-- Constants
local LOCAL_PLAYER = Game.GetLocalPlayer()
local TEXT_LETTER_COLUMN_SIZE = DIALOG_TEXT.fontSize / 2
local TEXT_LETTER_ROW_SIZE = DIALOG_TEXT.fontSize * 2
local REWARD_TEXT_LETTER_COLUMN_SIZE = REWARD_TEXT.fontSize / 2
local REWARD_TEXT_LETTER_ROW_SIZE = REWARD_TEXT.fontSize * 2

-- Internal variables
local currentText = ""
local currentAnimatedMesh = nil
local selectingOption = false
local textPrintTime = nil
local userPromtTime = nil

if(PRINT_TEXT_DELAY < 0) then
    warn("PrintTextDelay can't be less than 0")
    PRINT_TEXT_DELAY = 0.1
end

function ToggleUIInteraction(toggle)
    if toggle then
        PANEL.visibility = Visibility.INHERIT
        UI.SetCursorVisible(true)
        UI.SetCanCursorInteractWithUI(true)
    else
        PANEL.visibility = Visibility.FORCE_OFF
        UI.SetCursorVisible(false)
        UI.SetCanCursorInteractWithUI(false)
    end
end

-- nil PrintText(string)
-- Prints text slowly
function PrintText(text)
    textPrintTime = time()
    currentText = text
    text = string.gsub(text, "{name}", LOCAL_PLAYER.name)
    for i = 1, string.len(text) do
        if(PLAY_PRINT_SOUND) then
            PRINT_SOUND:Play()
        end
        DIALOG_TEXT.text = string.sub(text, 1, i)
        if time() - textPrintTime < PRINT_TEXT_DELAY * string.len(text) then
            Task.Wait(PRINT_TEXT_DELAY)
        end
    end
    textPrintTime = 0
end

function ResizePanelBasedOnText(text)
    local length = string.len(text)

    local width = PANEL.width + DIALOG_TEXT.width

    local column = width / TEXT_LETTER_COLUMN_SIZE
    local row = math.ceil(length / column)

    PANEL.height = row * TEXT_LETTER_ROW_SIZE - DIALOG_TEXT.height
end

function ResizeRewardPanelBasedOnText(text)
    local length = string.len(text)

    local width = REWARD_PANEL.width + REWARD_TEXT.width

    local column = width / REWARD_TEXT_LETTER_COLUMN_SIZE
    local row = math.ceil(length / column)

    REWARD_PANEL.height = row * REWARD_TEXT_LETTER_ROW_SIZE - REWARD_TEXT.height
end

function ShowReward(rewardTable)
    REWARD_PANEL.visibility = Visibility.INHERIT
    REWARD_SOUND:Play()

    Events.BroadcastToServer("DialogResourceReward", rewardTable.resource)

    ResizeRewardPanelBasedOnText(rewardTable.text)
    REWARD_TEXT.text = rewardTable.text
end

function ProcessDialog(dialogTable, id)
    if not dialogTable then return end
    if not dialogTable[id] then return end

    ToggleUIInteraction(true)

    if dialogTable[id].condition then

        INSTRUCTION_TEXT.text = ""

        local isConditionTrue = LOCAL_PLAYER:GetResource(dialogTable[id].condition.conditionResource) > 0

        if isConditionTrue then
            ProcessDialog(dialogTable, dialogTable[id].condition.targetDialogId1)
        else
            ProcessDialog(dialogTable, dialogTable[id].condition.targetDialogId2)
        end

        return
    end

    if dialogTable[id].texts then

        INSTRUCTION_TEXT.text = "Press [LMB] to continue"

        for _, textTable in ipairs(dialogTable[id].texts) do
            ResizePanelBasedOnText(textTable.text)

            if Object.IsValid(currentAnimatedMesh) and textTable.animation then
                currentAnimatedMesh:PlayAnimation(textTable.animation)
            end

            if textTable.rewardTable then
                ShowReward(textTable.rewardTable)
            end

            PrintText(textTable.text)

            userPromtTime = time()
            while time() - userPromtTime < PLAYER_PROMPT_DELAY do
                Task.Wait()
            end
            userPromtTime = 0

            REWARD_PANEL.visibility = Visibility.FORCE_OFF
        end
    end

    if dialogTable[id].options then
        userPromtTime = time()
        selectingOption = true

        INSTRUCTION_TEXT.text = "Select an option to continue"

        for i, optionTable in ipairs(dialogTable[id].options) do
            local instance = World.SpawnAsset(HELPER, {parent = OPTIONS_PANEL})
            instance.clientUserData.optionName = optionTable.optionName
            instance.clientUserData.dialogId = optionTable.dialogId
            if i == 1 then
                instance.y = 0
            else
                instance.y = -instance.height * (i - 1)
            end
        end

        while time() - userPromtTime < PLAYER_PROMPT_DELAY do
            userPromtTime = time()
            Task.Wait()
        end
        userPromtTime = 0
        selectingOption = false

        for _, child in ipairs(OPTIONS_PANEL:GetChildren()) do
            child:Destroy()
        end

        return
    end

    ToggleUIInteraction(false)
    currentAnimatedMesh = nil
end

function OnDialogOptionSelect(dialogId)
    userPromtTime = userPromtTime - PLAYER_PROMPT_DELAY
    ProcessDialog(API.GetDialogLibrary(), dialogId)
    CLICK_SOUND:Play()
end

function OnStartDialog(name, dialogId, sourceId)
    if name == "" then
        NAME_TEXT.text = "You"
    else
        NAME_TEXT.text = name
    end

    if sourceId then
        currentAnimatedMesh = World.FindObjectById(sourceId)
    end

    ProcessDialog(API.GetDialogLibrary(), dialogId)
end

function OnBindingPressed(player, binding)
	if binding == "ability_primary" then
        if textPrintTime and textPrintTime ~= 0 then
            textPrintTime = textPrintTime - (PRINT_TEXT_DELAY * string.len(currentText))
            CLICK_SOUND:Play()
        elseif userPromtTime and userPromtTime ~= 0 and not selectingOption then
            userPromtTime = userPromtTime - PLAYER_PROMPT_DELAY
            CLICK_SOUND:Play()
        end
	end
end

-- Initialize
for property, _ in pairs(LIBRARY_COLLECTION:GetCustomProperties()) do
    local asset = require(LIBRARY_COLLECTION:GetCustomProperty(property))
    asset.RegisterDialogue()
end

LOCAL_PLAYER.bindingPressedEvent:Connect(OnBindingPressed)
Events.Connect("DialogOptionSelect", OnDialogOptionSelect)
Events.Connect("StartDialog", OnStartDialog)

ToggleUIInteraction(false)