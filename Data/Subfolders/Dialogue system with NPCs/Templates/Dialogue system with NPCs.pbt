Assets {
  Id: 7948563900205283902
  Name: "Dialogue system with NPCs"
  PlatformAssetType: 5
  TemplateAsset {
    ObjectBlock {
      RootId: 486580391866106711
      Objects {
        Id: 486580391866106711
        Name: "TemplateBundleDummy"
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
        CameraCollidable {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        Folder {
          BundleDummy {
            ReferencedAssets {
              Id: 18410942744166893323
            }
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
  Marketplace {
    Id: "e8f39420ce10459c9435bc52a35d869d"
    OwnerAccountId: "dd9c125567704261953ffd885e60a898"
    OwnerName: "Hani"
    Version: "1.3.0"
    Description: "This is a dialogue system that I extracted from CoreHaven, It is simple and provides dialogues when interacted with,\r\nThe template has an example premade with it so you can edit it to your use.\r\n\r\nHow to use:\r\n\r\n -There should only be one Dialogue Display Manager!\r\n \r\n -The dialogues can be added as seen in the example \"genericconversation1\", which is located in the Dialogue Display Manager > Dialogs Collection, click on it and in custom edit the DialogsLibrary_conversations\r\n\r\n -The NPC to be used with the animation should be dragged and dropped in the custom of \"NPC Dialog Trigger\" located in \"NPC Dialog Group\" which is in \"Client Context\"\r\n\r\n===== I did not make this system, I only extracted it from CoreHaven ====="
  }
  SerializationVersion: 118
}
