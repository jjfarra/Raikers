Assets {
  Id: 9827836652447153496
  Name: "Weapon - Plasma Red"
  PlatformAssetType: 13
  SerializationVersion: 118
  CustomMaterialAsset {
    BaseMaterialId: 12789658363081938200
    ParameterOverrides {
      Overrides {
        Name: "outer color"
        Color {
          R: 0.539999962
          A: 1
        }
      }
      Overrides {
        Name: "plasma inner color"
        Color {
          R: 0.25
          A: 1
        }
      }
      Overrides {
        Name: "plasma outer color"
        Color {
          R: 0.460000038
          A: 1
        }
      }
      Overrides {
        Name: "inner color"
        Color {
          A: 1
        }
      }
      Overrides {
        Name: "plasma scale"
        Float: 152.497513
      }
      Overrides {
        Name: "fresnel exponent"
        Float: 0
      }
      Overrides {
        Name: "threshold max"
        Float: 0.317214578
      }
    }
    Assets {
      Id: 12789658363081938200
      Name: "Plasmafield Doublesided"
      PlatformAssetType: 2
      PrimaryAsset {
        AssetType: "MaterialAssetRef"
        AssetId: "fxma_plasmafield_doublesided"
      }
    }
  }
}
