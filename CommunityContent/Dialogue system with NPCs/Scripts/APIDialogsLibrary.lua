local API = {}

function API.RegisterDialogueId(dialogId)
    if not _G.APIDialogsLibrary then
        _G.APIDialogsLibrary = {}
    end

    if not _G.APIDialogsLibrary[dialogId] then
        _G.APIDialogsLibrary[dialogId] = {}
    else
        error("Can't register the same dialog id twice.")
    end
end

function API.SetCondition(dialogId, conditionResource, targetDialogId1, targetDialogId2)

    if not _G.APIDialogsLibrary or not _G.APIDialogsLibrary[dialogId] then
        warn("No registered "..dialogId.." found.")
        return
    end

    _G.APIDialogsLibrary[dialogId].condition = {
        conditionResource = conditionResource,
        targetDialogId1 = targetDialogId1,
        targetDialogId2 = targetDialogId2
    }
end

function API.AddText(dialogId, text, animation, rewardTable)

    if not _G.APIDialogsLibrary or not _G.APIDialogsLibrary[dialogId] then
        warn("No registered "..dialogId.." found.")
        return
    end

    if not _G.APIDialogsLibrary[dialogId].texts then
        _G.APIDialogsLibrary[dialogId].texts = {}
    end

    if text ~= nil then
        table.insert(_G.APIDialogsLibrary[dialogId].texts, {
            text = text,
            animation = animation,
            rewardTable = rewardTable
        })
    end
end

function API.AddOption(dialogId, optionName, targetDialogId)

    if not _G.APIDialogsLibrary or not _G.APIDialogsLibrary[dialogId] then
        warn("No registered "..dialogId.." found.")
        return
    end

    if not _G.APIDialogsLibrary[dialogId].options then
        _G.APIDialogsLibrary[dialogId].options = {}
    end

    table.insert(_G.APIDialogsLibrary[dialogId].options, {
        optionName = optionName,
        dialogId = targetDialogId
    })
end

function API.GetDialogLibrary()
    if not _G.APIDialogsLibrary then
        warn("No registered dialogs library found.")
        return nil
    end

    return _G.APIDialogsLibrary
end

function API.GetDialogTable(dialogId)

    if not _G.APIDialogsLibrary or not _G.APIDialogsLibrary[dialogId] then
        warn("No registered "..dialogId.." found.")
        return nil
    end

    return _G.APIDialogsLibrary[dialogId]
end

return API