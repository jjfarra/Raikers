Assets {
  Id: 15540503091374901068
  Name: "Swimming Volume"
  PlatformAssetType: 5
  TemplateAsset {
    ObjectBlock {
      RootId: 2948837357516169207
      Objects {
        Id: 2948837357516169207
        Name: "Swimming Volume"
        Transform {
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 4781671109827199097
        ChildIds: 17947286483503604816
        ChildIds: 18262330484769559344
        ChildIds: 16676447376068891605
        ChildIds: 15994696497384869103
        Folder {
          IsGroup: true
        }
        NetworkRelevanceDistance {
          Value: "mc:eproxyrelevance:critical"
        }
        IsReplicationEnabledByDefault: true
      }
      Objects {
        Id: 17947286483503604816
        Name: "Swimming Physics Volume"
        Transform {
          Location {
            Z: 200
          }
          Rotation {
          }
          Scale {
            X: 20
            Y: 20
            Z: 4
          }
        }
        ParentId: 2948837357516169207
        Collidable_v2 {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        Visible_v2 {
          Value: "mc:evisibilitysetting:inheritfromparent"
        }
        CameraCollidable {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        Blueprint {
          BlueprintAsset {
            Id: 2762119750109502089
          }
          TeamSettings {
          }
        }
        NetworkRelevanceDistance {
          Value: "mc:eproxyrelevance:critical"
        }
        IsReplicationEnabledByDefault: true
      }
      Objects {
        Id: 18262330484769559344
        Name: "Water"
        Transform {
          Location {
          }
          Rotation {
          }
          Scale {
            X: 20
            Y: 20
            Z: 4
          }
        }
        ParentId: 2948837357516169207
        UnregisteredParameters {
          Overrides {
            Name: "ma:Shared_BaseMaterial:id"
            AssetReference {
              Id: 9696391646837724873
            }
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:utile"
            Float: 0.25
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:vtile"
            Float: 0.25
          }
        }
        Collidable_v2 {
          Value: "mc:ecollisionsetting:forceoff"
        }
        Visible_v2 {
          Value: "mc:evisibilitysetting:inheritfromparent"
        }
        CameraCollidable {
          Value: "mc:ecollisionsetting:forceoff"
        }
        CoreMesh {
          MeshAsset {
            Id: 12095835209017042614
          }
          Teams {
          }
          StaticMesh {
            Physics {
              Mass: 100
              LinearDamping: 0.01
            }
            BoundsScale: 1
          }
        }
        Relevance {
          Value: "mc:eproxyrelevance:critical"
        }
        NetworkRelevanceDistance {
          Value: "mc:eproxyrelevance:critical"
        }
        IsReplicationEnabledByDefault: true
      }
      Objects {
        Id: 16676447376068891605
        Name: "Underwater Post Process"
        Transform {
          Location {
            Z: 200
          }
          Rotation {
          }
          Scale {
            X: 20
            Y: 20
            Z: 4
          }
        }
        ParentId: 2948837357516169207
        Collidable_v2 {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        Visible_v2 {
          Value: "mc:evisibilitysetting:inheritfromparent"
        }
        CameraCollidable {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        Blueprint {
          BlueprintAsset {
            Id: 8911691162201897975
          }
          TeamSettings {
          }
        }
        NetworkRelevanceDistance {
          Value: "mc:eproxyrelevance:critical"
        }
        IsReplicationEnabledByDefault: true
      }
      Objects {
        Id: 15994696497384869103
        Name: "Trigger"
        Transform {
          Location {
          }
          Rotation {
          }
          Scale {
            X: 20
            Y: 20
            Z: 4
          }
        }
        ParentId: 2948837357516169207
        ChildIds: 11381501098035438169
        ChildIds: 253579163789613834
        ChildIds: 15336104430456688349
        WantsNetworking: true
        Collidable_v2 {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        Visible_v2 {
          Value: "mc:evisibilitysetting:inheritfromparent"
        }
        CameraCollidable {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        Trigger {
          TeamSettings {
            IsTeamCollisionEnabled: true
            IsEnemyCollisionEnabled: true
          }
          TriggerShape_v2 {
            Value: "mc:etriggershape:box"
          }
          InteractionTemplate {
          }
          BreadcrumbTemplate {
          }
        }
        NetworkRelevanceDistance {
          Value: "mc:eproxyrelevance:critical"
        }
        IsReplicationEnabledByDefault: true
      }
      Objects {
        Id: 11381501098035438169
        Name: "SoundWater"
        Transform {
          Location {
            X: -80
            Y: 120
            Z: -50
          }
          Rotation {
          }
          Scale {
            X: 0.05
            Y: 0.05
            Z: 0.25
          }
        }
        ParentId: 15994696497384869103
        UnregisteredParameters {
          Overrides {
            Name: "cs:Trigger"
            ObjectReference {
              SubObjectId: 15994696497384869103
            }
          }
          Overrides {
            Name: "cs:WaterSound"
            ObjectReference {
              SubObjectId: 253579163789613834
            }
          }
          Overrides {
            Name: "cs:WaterJump"
            ObjectReference {
              SubObjectId: 15336104430456688349
            }
          }
        }
        WantsNetworking: true
        Collidable_v2 {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        Visible_v2 {
          Value: "mc:evisibilitysetting:inheritfromparent"
        }
        CameraCollidable {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        Script {
          ScriptAsset {
            Id: 18015333089241490163
          }
        }
        NetworkRelevanceDistance {
          Value: "mc:eproxyrelevance:critical"
        }
        IsReplicationEnabledByDefault: true
      }
      Objects {
        Id: 253579163789613834
        Name: "Nature Water Splash Medium 01 SFX"
        Transform {
          Location {
            X: -2.5
            Y: 2.5
            Z: -87.5
          }
          Rotation {
          }
          Scale {
            X: 0.05
            Y: 0.05
            Z: 0.25
          }
        }
        ParentId: 15994696497384869103
        WantsNetworking: true
        Collidable_v2 {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        Visible_v2 {
          Value: "mc:evisibilitysetting:inheritfromparent"
        }
        CameraCollidable {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        AudioInstance {
          AudioAsset {
            Id: 15930356655726736317
          }
          Pitch: -820.09668
          Volume: 0.5
          Radius: 1500
          EnableOcclusion: true
        }
        NetworkRelevanceDistance {
          Value: "mc:eproxyrelevance:critical"
        }
        IsReplicationEnabledByDefault: true
      }
      Objects {
        Id: 15336104430456688349
        Name: "Nature Water Splash Large 01 SFX"
        Transform {
          Location {
          }
          Rotation {
          }
          Scale {
            X: 0.05
            Y: 0.05
            Z: 0.25
          }
        }
        ParentId: 15994696497384869103
        WantsNetworking: true
        Collidable_v2 {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        Visible_v2 {
          Value: "mc:evisibilitysetting:inheritfromparent"
        }
        CameraCollidable {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        AudioInstance {
          AudioAsset {
            Id: 13056295709364866646
          }
          Volume: 1
          Radius: 1500
          EnableOcclusion: true
        }
        NetworkRelevanceDistance {
          Value: "mc:eproxyrelevance:critical"
        }
        IsReplicationEnabledByDefault: true
      }
    }
    Assets {
      Id: 2762119750109502089
      Name: "Swimming Physics Volume"
      PlatformAssetType: 6
      PrimaryAsset {
        AssetType: "BlueprintAssetRef"
        AssetId: "fxbp_swimming_physics_volume"
      }
    }
    Assets {
      Id: 12095835209017042614
      Name: "Cube"
      PlatformAssetType: 1
      PrimaryAsset {
        AssetType: "StaticMeshAssetRef"
        AssetId: "sm_cube_002"
      }
    }
    Assets {
      Id: 9696391646837724873
      Name: "Generic Water"
      PlatformAssetType: 2
      PrimaryAsset {
        AssetType: "MaterialAssetRef"
        AssetId: "fxma_parameter_driven_water_manual"
      }
    }
    Assets {
      Id: 8911691162201897975
      Name: "Underwater Post Process"
      PlatformAssetType: 20
      PrimaryAsset {
        AssetType: "BlueprintAssetRef"
        AssetId: "fxbp_post_process_water"
      }
    }
    Assets {
      Id: 15930356655726736317
      Name: "Nature Water Splash Medium 01 SFX"
      PlatformAssetType: 7
      PrimaryAsset {
        AssetType: "AudioAssetRef"
        AssetId: "sfx_nature_water_splash_medium_01a_Cue_ref"
      }
    }
    Assets {
      Id: 13056295709364866646
      Name: "Nature Water Splash Large 01 SFX"
      PlatformAssetType: 7
      PrimaryAsset {
        AssetType: "AudioAssetRef"
        AssetId: "sfx_water_splash_large_01_Cue_ref"
      }
    }
    PrimaryAssetId {
      AssetType: "None"
      AssetId: "None"
    }
  }
  Marketplace {
    Description: "You hear the fabulous sound  of swimming ,movement of player in fresh water, be careful not to drown!"
  }
  SerializationVersion: 118
  DirectlyPublished: true
}
