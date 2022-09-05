--[[
    API.SetCondition(string id, string resourceCondition, string dialogIdIfTrue, string dialogIdIfFalse)
    API.AddText(string id, string text, string animation, table rewardTable = {string resource, string text})
    API.AddOption(string id, string text, string targetDialogId)
 ]]

local Dialogs = {}
local API = require(script:GetCustomProperty("APIDialoguesLibrary"))

local YES_ANIMATION = "unarmed_yes"
local NO_ANIMATION = "unarmed_no"
local LAUGH_ANIMATION = "unarmed_laugh"
local CRY_ANIMATION = "unarmed_cry"
local WAVE_ANIMATION = "unarmed_wave"
local EXCITEMENT_ANIMATION = "unarmed_magic_up"
local TALK_ANIMATION = "unarmed_use"

function Dialogs.RegisterDialogue()
    local id = "" --Unique Id for each dialog

    -- Generic Conversations
    id = "GenericConversation1"
    API.RegisterDialogueId(id)
    API.AddText(id, "Hello fellas! I must warn you of what is comming...", WAVE_ANIMATION)
    API.AddText(id, "This is The Skelenton's Village, if you gusys enter you must know something important first...")

    API.AddOption(id, "Tell me.", "GenericConversation2")
    API.AddOption(id, "I don't care!", "GenericConversation3")

    id = "GenericConversation2"
    API.RegisterDialogueId(id)
    API.AddText(id, "The Skeletons robbed our most treasured object, they killed our people and they take our pride away. We need you guys...", "unarmed_yes")
    API.AddText(id, "...To go to each one of those temples behind you to grab ultra powerfull guns to kill them!!!", "unarmed_yes")
	API.AddText(id, "There you'll find the majestic sword, the magnanimous shield and the skull smasher wand!! Grab them and good luck!!", "unarmed_yes")
    id = "GenericConversation3"
    API.RegisterDialogueId(id)
    API.AddText(id, "The Skeletons robbed our most treasured object, they killed our people and they take our pride away. We need you guys...", "unarmed_yes")
    API.AddText(id, "...To go to each one of those temples behind you to grab ultra powerfull guns to kill them!!!", "unarmed_yes")
	API.AddText(id, "There you'll find the majestic sword, the magnanimous shield and the skull smasher wand!! Grab them and good luck!!", "unarmed_yes")

   
end

return Dialogs