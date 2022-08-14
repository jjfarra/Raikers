Assets {
  Id: 10104821073055404891
  Name: "Stone Foundation Stairs - Base Material - Castle"
  PlatformAssetType: 13
  SerializationVersion: 118
  CustomMaterialAsset {
    BaseMaterialId: 16301958412096069077
    ParameterOverrides {
      Overrides {
        Name: "gradient_worldspace"
        Bool: false
      }
      Overrides {
        Name: "gradient_color"
        Color {
          R: 0.467784
          G: 0.467784
          B: 0.391572
        }
      }
      Overrides {
        Name: "gradient_shift"
        Float: 0
      }
      Overrides {
        Name: "gradient_falloff"
        Float: 0
      }
    }
    Assets {
      Id: 16301958412096069077
      Name: "Stone (Stucco)"
      PlatformAssetType: 2
      PrimaryAsset {
        AssetType: "MaterialAssetRef"
        AssetId: "mi_trims_stone_stairs_01_default"
      }
    }
  }
}
