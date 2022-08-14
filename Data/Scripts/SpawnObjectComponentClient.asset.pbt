Assets {
  Id: 10920427621552078710
  Name: "SpawnObjectComponentClient"
  PlatformAssetType: 3
  TextAsset {
    CustomParameters {
      Overrides {
        Name: "cs:ComponentRoot"
        ObjectReference {
        }
      }
      Overrides {
        Name: "cs:APIInteractionModule"
        AssetReference {
          Id: 841534158063459245
        }
      }
      Overrides {
        Name: "cs:SubTarget"
        ObjectReference {
        }
      }
      Overrides {
        Name: "cs:SpawnTemplate"
        AssetReference {
          Id: 841534158063459245
        }
      }
      Overrides {
        Name: "cs:SpawnContainer"
        ObjectReference {
        }
      }
      Overrides {
        Name: "cs:SpawnOffset"
        Vector {
        }
      }
      Overrides {
        Name: "cs:PressBinding"
        String: "ability_primary"
      }
      Overrides {
        Name: "cs:UseInputNormal"
        Bool: false
      }
      Overrides {
        Name: "cs:UseInputPosition"
        Bool: false
      }
      Overrides {
        Name: "cs:SpawnOnBeginHover"
        Bool: false
      }
      Overrides {
        Name: "cs:SpawnOnEndHover"
        Bool: false
      }
      Overrides {
        Name: "cs:SpawnOnBeginPress"
        Bool: false
      }
      Overrides {
        Name: "cs:SpawnOnEndPress"
        Bool: false
      }
      Overrides {
        Name: "cs:SpawnOnBeginDrag"
        Bool: false
      }
      Overrides {
        Name: "cs:SpawnOnEndDrag"
        Bool: false
      }
      Overrides {
        Name: "cs:SpawnOnBeginDragOver"
        Bool: false
      }
      Overrides {
        Name: "cs:SpawnOnEndDragOver"
        Bool: false
      }
      Overrides {
        Name: "cs:SpawnOnDropped"
        Bool: false
      }
      Overrides {
        Name: "cs:SpawnOnSelected"
        Bool: false
      }
      Overrides {
        Name: "cs:SpawnOnDeselected"
        Bool: false
      }
      Overrides {
        Name: "cs:ComponentRoot:tooltip"
        String: "The Component Root is registered as the target and any interactions will affect it and potentially its children"
      }
      Overrides {
        Name: "cs:APIInteractionModule:tooltip"
        String: "Must be set to a compatible Input Module"
      }
      Overrides {
        Name: "cs:SpawnTemplate:tooltip"
        String: "The template that should spawn"
      }
      Overrides {
        Name: "cs:SpawnOffset:tooltip"
        String: "This will offset the spawned template. If the template is parented this will use local space, otherwise world space"
      }
      Overrides {
        Name: "cs:SpawnContainer:tooltip"
        String: "Optional object to spawn the template as a child in"
      }
      Overrides {
        Name: "cs:UseInputPosition:tooltip"
        String: "If true the template will spawn at the position input occurred at"
      }
      Overrides {
        Name: "cs:UseInputNormal:tooltip"
        String: "If true the template will rotate so that its up vector is aligned with the input normal"
      }
      Overrides {
        Name: "cs:SpawnOnBeginHover:tooltip"
        String: "If true the template will spawn when a hover begins"
      }
      Overrides {
        Name: "cs:SpawnOnEndHover:tooltip"
        String: "If true the template will spawn when a hover ends"
      }
      Overrides {
        Name: "cs:SpawnOnBeginPress:tooltip"
        String: "If true the template will spawn when a press begins"
      }
      Overrides {
        Name: "cs:SpawnOnEndPress:tooltip"
        String: "If true the template will spawn when a press ends"
      }
      Overrides {
        Name: "cs:PressBinding:tooltip"
        String: "The binding to use for press interactions"
      }
      Overrides {
        Name: "cs:SubTarget:tooltip"
        String: "The Sub Target can be used to set a specific Trigger or UIButton to use for interaction events. If left blank the Input Module will find the first appropriate object."
      }
      Overrides {
        Name: "cs:SpawnOnBeginDrag:tooltip"
        String: "If true the template will spawn when a drag begins"
      }
      Overrides {
        Name: "cs:SpawnOnEndDrag:tooltip"
        String: "If true the template will spawn when a drag ends"
      }
      Overrides {
        Name: "cs:SpawnOnBeginDragOver:tooltip"
        String: "If true the template will spawn when an object is dragged over this"
      }
      Overrides {
        Name: "cs:SpawnOnEndDragOver:tooltip"
        String: "If true the template will spawn when an object is dragged away from this"
      }
      Overrides {
        Name: "cs:SpawnOnDropped:tooltip"
        String: "If true the template will spawn when this is dropped"
      }
      Overrides {
        Name: "cs:SpawnOnSelected:tooltip"
        String: "If true the template will spawn when this is selected"
      }
      Overrides {
        Name: "cs:SpawnOnDeselected:tooltip"
        String: "If true the template will spawn when this is deselected"
      }
    }
  }
  SerializationVersion: 118
  VirtualFolderPath: "Interaction System"
  VirtualFolderPath: "Components"
}
