local Equipment = script:GetCustomProperty("Equipment"):WaitForObject()
local DeployShieldAbility = Equipment:GetCustomProperty("DeployShieldAbility"):WaitForObject()
local EnergyShield = script:GetCustomProperty("EnergyShield")

local currentShield

local function destroyShield()
	if(not Object.IsValid(currentShield)) then return end

	currentShield:Destroy()
	currentShield = nil
end

local function deployShield(ability)
	local hitResult = World.Raycast(ability.owner:GetWorldPosition() + Vector3.New(0, 0, 1000), ability.owner:GetWorldPosition() - Vector3.New(0, 0, 10000), {
		ignorePlayers = true,
	})
	if(not hitResult) then return end

	local impactPosition = hitResult:GetImpactPosition()
	if(not impactPosition:IsA("Vector3")) then return end

	currentShield = World.SpawnAsset(EnergyShield, {
		position = impactPosition - Vector3.New(0, 0, 150),
		scale = Vector3.New(10)
	})
end

DeployShieldAbility.executeEvent:Connect(deployShield)
DeployShieldAbility.cooldownEvent:Connect(destroyShield)
DeployShieldAbility.interruptedEvent:Connect(destroyShield)