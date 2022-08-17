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
    API.AddText(id, "Hola!", WAVE_ANIMATION)
    API.AddText(id, "Nustro pueblo sufre, ¿Deseas saber por qué?")

    API.AddOption(id, "Sí.", "GenericConversation2")
    API.AddOption(id, "No.", "GenericConversation3")

    id = "GenericConversation2"
    API.RegisterDialogueId(id)
    API.AddText(id, "El líder de los esqueleticos ha robado nuestro tesoro más preciado...", "unarmed_yes")
    API.AddText(id, "Ahora estamos invadidos por ellos y no podemos ser libres, encuentra y mata a cuantos esqueleticos puedas!!!!", "unarmed_laugh")

    id = "GenericConversation3"
    API.RegisterDialogueId(id)
    API.AddText(id, "De igual manera te dire... Cómo quisiera volver a la normalidad...", "unarmed_yes")
    API.AddText(id, "Los enqueleticos nos han invadido, encuentra y mata a cuantos de ellos puedas!!!!")

   
end

return Dialogs