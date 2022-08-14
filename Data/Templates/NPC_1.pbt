Assets {
  Id: 10675140464168736638
  Name: "NPC_1"
  PlatformAssetType: 5
  TemplateAsset {
    ObjectBlock {
      RootId: 14830141046582658629
      Objects {
        Id: 14830141046582658629
        Name: "NPC_1"
        Transform {
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 11673090391162795620
        ChildIds: 16491437800772329008
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
      }
      Objects {
        Id: 16491437800772329008
        Name: "NPC_1"
        Transform {
          Location {
            X: 4.04986572
            Y: -5.13220215
            Z: -67.5263672
          }
          Rotation {
            Yaw: -108.618561
          }
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 14830141046582658629
        UnregisteredParameters {
          Overrides {
            Name: "ma:1:Shared_BaseMaterial:color"
            Color {
              G: 0.313377321
              B: 0.52
              A: 1
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
          Value: "mc:ecollisionsetting:forceoff"
        }
        EditorIndicatorVisibility {
          Value: "mc:eindicatorvisibility:visiblewhenselected"
        }
        CoreMesh {
          MeshAsset {
            Id: 15689915626298582626
          }
          Teams {
            IsTeamCollisionEnabled: true
            IsEnemyCollisionEnabled: true
          }
          AnimatedMesh {
            AnimationStance: "unarmed_idle_relaxed"
            AnimationStancePlaybackRate: 1
            AnimationStanceShouldLoop: true
            AnimationPlaybackRateMultiplier: 1
            PlayOnStartAnimation {
              Animation: "unarmed_talk_casual"
              PlaybackRate: 1
            }
            SkinnedMeshes {
              Id: 14535745305615895087
            }
            SkinnedMeshes {
              Id: 269329319087887394
            }
            SkinnedMeshes {
              Id: 15899401262575502651
            }
            SkinnedMeshes {
              Id: 3844055050293223721
            }
          }
        }
      }
    }
    Assets {
      Id: 15689915626298582626
      Name: "Humanoid 2 Rig"
      PlatformAssetType: 25
      PrimaryAsset {
        AssetType: "SkeletonAssetRef"
        AssetId: "npc_guy_wireframe_001_ref"
      }
    }
    Assets {
      Id: 14535745305615895087
      Name: "Humanoid 2 Ramesh"
      PlatformAssetType: 26
      PrimaryAsset {
        AssetType: "SkinnedMeshAssetRef"
        AssetId: "npc_human_guy_head_basic_008_ref"
      }
    }
    Assets {
      Id: 269329319087887394
      Name: "Humanoid 2 Peasant Shirt"
      PlatformAssetType: 26
      PrimaryAsset {
        AssetType: "SkinnedMeshAssetRef"
        AssetId: "npc_human_guy_upper_fantasy_000_ref_temp"
      }
    }
    Assets {
      Id: 15899401262575502651
      Name: "Humanoid 2 Peasant Pants"
      PlatformAssetType: 26
      PrimaryAsset {
        AssetType: "SkinnedMeshAssetRef"
        AssetId: "npc_human_guy_lower_fantasy_000_ref"
      }
    }
    Assets {
      Id: 3844055050293223721
      Name: "Humanoid 2 Minh Hair"
      PlatformAssetType: 26
      PrimaryAsset {
        AssetType: "SkinnedMeshAssetRef"
        AssetId: "npc_human_guy_hair_basic_002_ref"
      }
    }
    PrimaryAssetId {
      AssetType: "None"
      AssetId: "None"
    }
  }
  SerializationVersion: 118
}
