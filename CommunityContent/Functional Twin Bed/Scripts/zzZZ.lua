
local zText1 = script:GetCustomProperty("ZText1"):WaitForObject()
local zText2 = script:GetCustomProperty("ZText2"):WaitForObject()

script.parent:LookAtLocalView(true)


function UpdateText(text, phase)
	local time = math.fmod(time() * 0.75 + phase, math.pi)

	local t = (1 - math.cos(time * 2)) / 2
	
	text:SetScale(t * Vector3.ONE * 1.5)
	
	local y = (1 - math.cos(time)) * -15 --time * -30
	local z = time * 25
	text:SetPosition(Vector3.New(0, y, z))
end

function Tick()
	UpdateText(zText1, 0)
	UpdateText(zText2, math.pi / 2)
end