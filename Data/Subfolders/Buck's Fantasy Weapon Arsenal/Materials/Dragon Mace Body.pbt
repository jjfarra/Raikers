Assets {
  Id: 16221828466305191861
  Name: "Dragon Mace Body"
  PlatformAssetType: 13
  SerializationVersion: 118
  CustomMaterialAsset {
    BaseMaterialId: 10657227543465871079
    ParameterOverrides {
      Overrides {
        Name: "primary color"
        Color {
          R: 0.03125
          G: 0.03125
          B: 0.03125
          A: 1
        }
      }
      Overrides {
        Name: "secondary color"
        Color {
          R: 0.03125
          G: 0.03125
          B: 0.03125
          A: 1
        }
      }
      Overrides {
        Name: "fresnel_color"
        Color {
          R: 0.26
          A: 1
        }
      }
      Overrides {
        Name: "tertiary color"
        Color {
          R: 0.03125
          G: 0.03125
          B: 0.03125
          A: 1
        }
      }
      Overrides {
        Name: "fresnel_power"
        Float: 0
      }
      Overrides {
        Name: "fresnel_emissive_boost"
        Float: 17.243391
      }
      Overrides {
        Name: "specular"
        Float: 1
      }
      Overrides {
        Name: "color"
        Color {
          R: 1
          G: 1
          B: 1
          A: 1
        }
      }
    }
    Assets {
      Id: 10657227543465871079
      Name: "Whelp Body Material"
      PlatformAssetType: 2
      PrimaryAsset {
        AssetType: "MaterialAssetRef"
        AssetId: "npc_dragon_body_001_mi_ref"
      }
    }
  }
}
