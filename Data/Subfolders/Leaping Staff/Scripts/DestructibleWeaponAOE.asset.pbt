Assets {
  Id: 8729958416214615783
  Name: "DestructibleWeaponAOE"
  PlatformAssetType: 3
  TextAsset {
    CustomParameters {
      Overrides {
        Name: "cs:ModuleManager"
        AssetReference {
          Id: 2710660413884090461
        }
      }
      Overrides {
        Name: "cs:AttackAbility"
        ObjectReference {
        }
      }
      Overrides {
        Name: "cs:BlastImpactTemplate"
        AssetReference {
          Id: 7566019890327736608
        }
      }
      Overrides {
        Name: "cs:BlastDamageRange"
        Vector2 {
          X: 46
          Y: 86
        }
      }
      Overrides {
        Name: "cs:BlastRadius"
        Float: 600
      }
      Overrides {
        Name: "cs:BlastKnockbackSpeed"
        Float: 0
      }
    }
  }
  SerializationVersion: 118
}
