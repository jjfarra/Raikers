Assets {
  Id: 4592224230988680259
  Name: "Interaction Settings"
  PlatformAssetType: 5
  TemplateAsset {
    ObjectBlock {
      RootId: 2943658515781597682
      Objects {
        Id: 2943658515781597682
        Name: "Interaction Settings"
        Transform {
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 4781671109827199097
        ChildIds: 2769208272527561403
        UnregisteredParameters {
          Overrides {
            Name: "cs:CursorModule_DragUIContainer"
            ObjectReference {
            }
          }
          Overrides {
            Name: "cs:LookModule_Distance"
            Float: 2000
          }
          Overrides {
            Name: "cs:LookModule_SelectionSize"
            Float: 50
          }
          Overrides {
            Name: "cs:TriggerModule_OnlyLocalPlayer"
            Bool: true
          }
          Overrides {
            Name: "cs:CameraModule_Distance"
            Float: 2000
          }
          Overrides {
            Name: "cs:CameraModule_SelectionSize"
            Float: 50
          }
          Overrides {
            Name: "cs:ShowDebug"
            Bool: false
          }
          Overrides {
            Name: "cs:CursorModule_DragUIContainer:tooltip"
            String: "If you need to use a specific UIContainer to spawn drag proxy objects into you can define that here"
          }
          Overrides {
            Name: "cs:LookModule_Distance:tooltip"
            String: "The distance the raycast will travel when using the Look Interaction Module. Useful for limiting interaction distance to near the Player."
          }
          Overrides {
            Name: "cs:TriggerModule_OnlyLocalPlayer:tooltip"
            String: "If true, trigger hover interactions will only fire for the local Player. Otherwise trigger hover interactions from all Players will fire. This can be used to mimic networking without actually using networking."
          }
          Overrides {
            Name: "cs:ShowDebug:tooltip"
            String: "This will draw some debug gizmos on some interaction types in Editor."
          }
          Overrides {
            Name: "cs:CameraModule_Distance:category"
            String: "Custom"
          }
          Overrides {
            Name: "cs:CameraModule_SelectionSize:category"
            String: "Custom"
          }
          Overrides {
            Name: "cs:LookModule_SelectionSize:tooltip"
            String: "The thickness of the raycast when using the Look Interaction Module."
          }
          Overrides {
            Name: "cs:CameraModule_Distance:tooltip"
            String: "The distance the raycast will travel when using the Camera Direction Interaction Module."
          }
          Overrides {
            Name: "cs:CameraModule_SelectionSize:tooltip"
            String: "The thickness of the raycast when using the Camera Direction Interaction Module."
          }
        }
        Collidable_v2 {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        Visible_v2 {
          Value: "mc:evisibilitysetting:inheritfromparent"
        }
        CameraCollidable {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        EditorIndicatorVisibility {
          Value: "mc:eindicatorvisibility:visiblewhenselected"
        }
        Folder {
          IsGroup: true
        }
        NetworkRelevanceDistance {
          Value: "mc:eproxyrelevance:critical"
        }
        IsReplicationEnabledByDefault: true
      }
      Objects {
        Id: 2769208272527561403
        Name: "ClientContext"
        Transform {
          Location {
          }
          Rotation {
          }
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 2943658515781597682
        ChildIds: 3794839571470154640
        Collidable_v2 {
          Value: "mc:ecollisionsetting:forceoff"
        }
        Visible_v2 {
          Value: "mc:evisibilitysetting:inheritfromparent"
        }
        CameraCollidable {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        EditorIndicatorVisibility {
          Value: "mc:eindicatorvisibility:visiblewhenselected"
        }
        NetworkContext {
          MinDetailLevel {
            Value: "mc:edetaillevel:low"
          }
          MaxDetailLevel {
            Value: "mc:edetaillevel:ultra"
          }
        }
        IsAdvanced: true
        NetworkRelevanceDistance {
          Value: "mc:eproxyrelevance:critical"
        }
        IsReplicationEnabledByDefault: true
      }
      Objects {
        Id: 3794839571470154640
        Name: "InputSettingsClient"
        Transform {
          Location {
          }
          Rotation {
          }
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 2769208272527561403
        UnregisteredParameters {
          Overrides {
            Name: "cs:ComponentRoot"
            ObjectReference {
              SubObjectId: 2943658515781597682
            }
          }
        }
        Collidable_v2 {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        Visible_v2 {
          Value: "mc:evisibilitysetting:inheritfromparent"
        }
        CameraCollidable {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        EditorIndicatorVisibility {
          Value: "mc:eindicatorvisibility:visiblewhenselected"
        }
        Script {
          ScriptAsset {
            Id: 15086809800626133535
          }
        }
        NetworkRelevanceDistance {
          Value: "mc:eproxyrelevance:critical"
        }
        IsReplicationEnabledByDefault: true
      }
    }
    PrimaryAssetId {
      AssetType: "None"
      AssetId: "None"
    }
  }
  SerializationVersion: 118
  VirtualFolderPath: "Interaction System"
}
