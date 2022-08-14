Assets {
  Id: 1316401359149375557
  Name: "swimming pool 1"
  PlatformAssetType: 5
  TemplateAsset {
    ObjectBlock {
      RootId: 10214526548048093263
      Objects {
        Id: 10214526548048093263
        Name: "swimming pool"
        Transform {
          Scale {
            X: 9.79295635
            Y: 13.8992624
            Z: 10.8511248
          }
        }
        ParentId: 4781671109827199097
        ChildIds: 16337779667655472476
        UnregisteredParameters {
          Overrides {
            Name: "ma:Shared_BaseMaterial:id"
            AssetReference {
              Id: 6501427117895907163
            }
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
            IsTeamCollisionEnabled: true
            IsEnemyCollisionEnabled: true
          }
          InteractWithTriggers: true
          StaticMesh {
            Physics {
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
        Id: 16337779667655472476
        Name: "Underwater Post Process (for swimming)"
        Transform {
          Location {
            Y: -3.51300114e-05
            Z: 49.9999962
          }
          Rotation {
          }
          Scale {
            X: 1.00000012
            Y: 1.00000012
            Z: 1
          }
        }
        ParentId: 10214526548048093263
        ChildIds: 7624422328023152402
        ChildIds: 17580715794127813419
        ChildIds: 6878733301919199753
        ChildIds: 1922902576822163863
        ChildIds: 6353929683976102666
        ChildIds: 14082591318173719132
        ChildIds: 6813810654705697824
        ChildIds: 3329426056875978328
        UnregisteredParameters {
          Overrides {
            Name: "bp:Control Fog"
            Bool: true
          }
          Overrides {
            Name: "bp:Create Water Physics Volume"
            Bool: true
          }
          Overrides {
            Name: "bp:Caustics"
            Bool: true
          }
          Overrides {
            Name: "bp:Water"
            Bool: true
          }
          Overrides {
            Name: "bp:Distortion Amount"
            Float: 1.08831894
          }
          Overrides {
            Name: "bp:Fog Density"
            Float: 0.370026618
          }
          Overrides {
            Name: "bp:Caustics Fade Distance"
            Float: 1.95782602
          }
          Overrides {
            Name: "bp:Use Sun Direction for Directional Caustics"
            Bool: true
          }
          Overrides {
            Name: "bp:Fog Color"
            Color {
              G: 0.139999986
              B: 0.123311289
              A: 1
            }
          }
          Overrides {
            Name: "bp:Fog Extinction Scale"
            Float: 6.91150284
          }
          Overrides {
            Name: "bp:Fog Scattering Distribution"
            Float: 0.277838647
          }
          Overrides {
            Name: "bp:Caustics Brightness"
            Float: 19.5769691
          }
          Overrides {
            Name: "bp:Distortion Speed"
            Float: 0.426363707
          }
          Overrides {
            Name: "bp:Distortion Scale"
            Float: 2.90132618
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
        Blueprint {
          BlueprintAsset {
            Id: 16244414786145463704
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
        Id: 7624422328023152402
        Name: "Whitebox Wall 01 Half"
        Transform {
          Location {
            X: 5.10571
            Y: -50.362339
            Z: -49.9999962
          }
          Rotation {
          }
          Scale {
            X: 0.102114201
            Y: 0.0719462484
            Z: 0.0921563432
          }
        }
        ParentId: 16337779667655472476
        Collidable_v2 {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        Visible_v2 {
          Value: "mc:evisibilitysetting:inheritfromparent"
        }
        CameraCollidable {
          Value: "mc:ecollisionsetting:forceoff"
        }
        CoreMesh {
          MeshAsset {
            Id: 8991737701756133244
          }
          Teams {
            IsTeamCollisionEnabled: true
            IsEnemyCollisionEnabled: true
          }
          InteractWithTriggers: true
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
        Id: 17580715794127813419
        Name: "Whitebox Wall 01 Half"
        Transform {
          Location {
            X: 5.10571
            Y: 50.3624077
            Z: -49.9999962
          }
          Rotation {
          }
          Scale {
            X: 0.102114201
            Y: 0.0719462484
            Z: 0.0921563432
          }
        }
        ParentId: 16337779667655472476
        Collidable_v2 {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        Visible_v2 {
          Value: "mc:evisibilitysetting:inheritfromparent"
        }
        CameraCollidable {
          Value: "mc:ecollisionsetting:forceoff"
        }
        CoreMesh {
          MeshAsset {
            Id: 8991737701756133244
          }
          Teams {
            IsTeamCollisionEnabled: true
            IsEnemyCollisionEnabled: true
          }
          InteractWithTriggers: true
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
        Id: 6878733301919199753
        Name: "Whitebox Wall 01 Half"
        Transform {
          Location {
            X: -35.7399712
            Y: -50.362339
            Z: -49.9999962
          }
          Rotation {
          }
          Scale {
            X: 0.102114201
            Y: 0.0719462484
            Z: 0.0921563432
          }
        }
        ParentId: 16337779667655472476
        Collidable_v2 {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        Visible_v2 {
          Value: "mc:evisibilitysetting:inheritfromparent"
        }
        CameraCollidable {
          Value: "mc:ecollisionsetting:forceoff"
        }
        CoreMesh {
          MeshAsset {
            Id: 8991737701756133244
          }
          Teams {
            IsTeamCollisionEnabled: true
            IsEnemyCollisionEnabled: true
          }
          InteractWithTriggers: true
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
        Id: 1922902576822163863
        Name: "Whitebox Wall 01 Half"
        Transform {
          Location {
            X: 45.9513893
            Y: -50.362339
            Z: -49.9999962
          }
          Rotation {
            Yaw: 89.9999924
          }
          Scale {
            X: 0.357399702
            Y: 0.0719462484
            Z: 0.0921563432
          }
        }
        ParentId: 16337779667655472476
        Collidable_v2 {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        Visible_v2 {
          Value: "mc:evisibilitysetting:inheritfromparent"
        }
        CameraCollidable {
          Value: "mc:ecollisionsetting:forceoff"
        }
        CoreMesh {
          MeshAsset {
            Id: 8991737701756133244
          }
          Teams {
            IsTeamCollisionEnabled: true
            IsEnemyCollisionEnabled: true
          }
          InteractWithTriggers: true
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
        Id: 6353929683976102666
        Name: "Whitebox Wall 01 Half"
        Transform {
          Location {
            X: -51.0571
            Y: -50.362339
            Z: -49.9999962
          }
          Rotation {
          }
          Scale {
            X: 0.102114201
            Y: 0.0719462484
            Z: 0.0921563432
          }
        }
        ParentId: 16337779667655472476
        Collidable_v2 {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        Visible_v2 {
          Value: "mc:evisibilitysetting:inheritfromparent"
        }
        CameraCollidable {
          Value: "mc:ecollisionsetting:forceoff"
        }
        CoreMesh {
          MeshAsset {
            Id: 8991737701756133244
          }
          Teams {
            IsTeamCollisionEnabled: true
            IsEnemyCollisionEnabled: true
          }
          InteractWithTriggers: true
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
        Id: 14082591318173719132
        Name: "Whitebox Wall 01 Half"
        Transform {
          Location {
            X: -30.6342602
            Y: 50.3624077
            Z: -49.9999962
          }
          Rotation {
          }
          Scale {
            X: 0.102114201
            Y: 0.0719462484
            Z: 0.0921563432
          }
        }
        ParentId: 16337779667655472476
        Collidable_v2 {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        Visible_v2 {
          Value: "mc:evisibilitysetting:inheritfromparent"
        }
        CameraCollidable {
          Value: "mc:ecollisionsetting:forceoff"
        }
        CoreMesh {
          MeshAsset {
            Id: 8991737701756133244
          }
          Teams {
            IsTeamCollisionEnabled: true
            IsEnemyCollisionEnabled: true
          }
          InteractWithTriggers: true
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
        Id: 6813810654705697824
        Name: "Whitebox Wall 01 Half"
        Transform {
          Location {
            X: -51.0571
            Y: 50.3624077
            Z: -49.9999962
          }
          Rotation {
          }
          Scale {
            X: 0.102114201
            Y: 0.0719462484
            Z: 0.0921563432
          }
        }
        ParentId: 16337779667655472476
        Collidable_v2 {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        Visible_v2 {
          Value: "mc:evisibilitysetting:inheritfromparent"
        }
        CameraCollidable {
          Value: "mc:ecollisionsetting:forceoff"
        }
        CoreMesh {
          MeshAsset {
            Id: 8991737701756133244
          }
          Teams {
            IsTeamCollisionEnabled: true
            IsEnemyCollisionEnabled: true
          }
          InteractWithTriggers: true
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
        Id: 3329426056875978328
        Name: "Whitebox Wall 01 Half"
        Transform {
          Location {
            X: -51.0571
            Y: -50.362339
            Z: -49.9999962
          }
          Rotation {
            Yaw: 89.9999924
          }
          Scale {
            X: 0.357399702
            Y: 0.0719462484
            Z: 0.0921563432
          }
        }
        ParentId: 16337779667655472476
        Collidable_v2 {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        Visible_v2 {
          Value: "mc:evisibilitysetting:inheritfromparent"
        }
        CameraCollidable {
          Value: "mc:ecollisionsetting:forceoff"
        }
        CoreMesh {
          MeshAsset {
            Id: 8991737701756133244
          }
          Teams {
            IsTeamCollisionEnabled: true
            IsEnemyCollisionEnabled: true
          }
          InteractWithTriggers: true
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
      Id: 16244414786145463704
      Name: "Underwater Post Process"
      PlatformAssetType: 20
      PrimaryAsset {
        AssetType: "BlueprintAssetRef"
        AssetId: "fxbp_post_process_water"
      }
    }
    Assets {
      Id: 8991737701756133244
      Name: "Whitebox Wall 01 Half"
      PlatformAssetType: 1
      PrimaryAsset {
        AssetType: "StaticMeshAssetRef"
        AssetId: "sm_ts_gen_whitebox_wall_001_half"
      }
    }
    PrimaryAssetId {
      AssetType: "None"
      AssetId: "None"
    }
  }
  Marketplace {
    Description: "Swimmingpool"
  }
  SerializationVersion: 118
  DirectlyPublished: true
}
