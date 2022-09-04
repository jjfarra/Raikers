Assets {
  Id: 15221727918428024193
  Name: "Mace Geo 3 Plasma"
  PlatformAssetType: 13
  SerializationVersion: 118
  CustomMaterialAsset {
    BaseMaterialId: 12789658363081938200
    ParameterOverrides {
      Overrides {
        Name: "outer color"
        Color {
          R: 4
          G: 0.384525537
          A: 1
        }
      }
      Overrides {
        Name: "plasma inner color"
        Color {
          R: 1
          G: 0.691721857
          B: 0.0500000119
          A: 1
        }
      }
      Overrides {
        Name: "plasma outer color"
        Color {
          R: 4
          G: 0.384525537
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
        Float: 81.2654343
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
