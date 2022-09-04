Assets {
  Id: 11938628521470903698
  Name: "Energy Shield"
  PlatformAssetType: 5
  TemplateAsset {
    ObjectBlock {
      RootId: 1434902589577453322
      Objects {
        Id: 1434902589577453322
        Name: "Energy Shield"
        Transform {
          Scale {
            X: 10
            Y: 10
            Z: 10
          }
        }
        ParentId: 4781671109827199097
        ChildIds: 4443930409068074409
        WantsNetworking: true
        Collidable_v2 {
          Value: "mc:ecollisionsetting:forceoff"
        }
        Visible_v2 {
          Value: "mc:evisibilitysetting:forceoff"
        }
        CameraCollidable {
          Value: "mc:ecollisionsetting:forceoff"
        }
        CoreMesh {
          MeshAsset {
            Id: 18120287186582886745
          }
          Teams {
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
        Id: 4443930409068074409
        Name: "VFX"
        Transform {
          Location {
          }
          Rotation {
          }
          Scale {
            X: 0.5
            Y: 0.5
            Z: 0.5
          }
        }
        ParentId: 1434902589577453322
        UnregisteredParameters {
          Overrides {
            Name: "bp:Type"
            Enum {
              Value: "mc:evfxshieldpanels:4"
            }
          }
          Overrides {
            Name: "bp:Base Shield Color"
            Color {
              R: 0.0199999809
              G: 1
              B: 0.92211926
              A: 1
            }
          }
          Overrides {
            Name: "bp:Edge Color"
            Color {
              G: 0.314767957
              B: 0.49
              A: 1
            }
          }
          Overrides {
            Name: "bp:Crack Edge Color"
            Color {
              R: 0.0482121818
              B: 0.909999967
              A: 1
            }
          }
          Overrides {
            Name: "bp:Emissive Boost"
            Float: 15
          }
          Overrides {
            Name: "bp:Overall Opacity"
            Float: 1
          }
          Overrides {
            Name: "bp:Pattern Blend Amount"
            Float: 0
          }
          Overrides {
            Name: "bp:Invert Texture"
            Float: 0
          }
          Overrides {
            Name: "bp:Enable Circle Mask"
            Bool: false
          }
          Overrides {
            Name: "bp:Enable Detail Lines"
            Bool: true
          }
          Overrides {
            Name: "bp:Enable Circular Pulse"
            Bool: false
          }
          Overrides {
            Name: "bp:Change Linear Pulse Axis"
            Bool: false
          }
          Overrides {
            Name: "bp:Pulse Brightness"
            Float: 5
          }
          Overrides {
            Name: "bp:Pulse Speed"
            Float: 1
          }
          Overrides {
            Name: "bp:Enable Edge Noise"
            Bool: true
          }
          Overrides {
            Name: "bp: Invert Crack Direction"
            Bool: false
          }
          Overrides {
            Name: "bp: Enable Filled In Cracks"
            Bool: true
          }
          Overrides {
            Name: "bp:Damage"
            Float: 0
          }
        }
        WantsNetworking: true
        Collidable_v2 {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        Visible_v2 {
          Value: "mc:evisibilitysetting:forceon"
        }
        CameraCollidable {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        Blueprint {
          BlueprintAsset {
            Id: 4020545220962390676
          }
          TeamSettings {
          }
          Vfx {
            AutoPlay: true
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
      Id: 18120287186582886745
      Name: "Sphere - Half"
      PlatformAssetType: 1
      PrimaryAsset {
        AssetType: "StaticMeshAssetRef"
        AssetId: "sm_hemisphere_001"
      }
    }
    Assets {
      Id: 4020545220962390676
      Name: "Energy Shield Panel"
      PlatformAssetType: 8
      PrimaryAsset {
        AssetType: "VfxBlueprintAssetRef"
        AssetId: "fxbp_forceField"
      }
    }
    PrimaryAssetId {
      AssetType: "None"
      AssetId: "None"
    }
  }
  SerializationVersion: 118
}
