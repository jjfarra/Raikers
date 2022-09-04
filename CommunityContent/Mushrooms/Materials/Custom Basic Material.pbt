Assets {
  Id: 3527121051239936896
  Name: "Custom Basic Material"
  PlatformAssetType: 13
  SerializationVersion: 118
  CustomMaterialAsset {
    BaseMaterialId: 10184847056121543272
    ParameterOverrides {
      Overrides {
        Name: "color"
        Color {
          R: 0.190000057
          A: 1
        }
      }
      Overrides {
        Name: "specular"
        Float: 0.244398221
      }
      Overrides {
        Name: "roughness"
        Float: 0.873571694
      }
      Overrides {
        Name: "gradient_color"
        Color {
          R: 0.65
          G: 0.0258278
          A: 1
        }
      }
      Overrides {
        Name: "gradient_shift"
        Float: 0.719246149
      }
      Overrides {
        Name: "gradient_falloff"
        Float: 1
      }
      Overrides {
        Name: "metallic"
        Float: 0
      }
      Overrides {
        Name: "gradient_direction"
        Vector {
          Z: -1
        }
      }
      Overrides {
        Name: "fresnel_emissive_boost"
        Float: 0
      }
      Overrides {
        Name: "gradient_worldspace"
        Bool: true
      }
    }
    Assets {
      Id: 10184847056121543272
      Name: "Basic Material"
      PlatformAssetType: 2
      PrimaryAsset {
        AssetType: "MaterialAssetRef"
        AssetId: "mi_basic_pbr_material_001"
      }
    }
  }
}
