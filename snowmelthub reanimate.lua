if TORSOFLING == true and BULLETFLING == false then
    _G.flingy = Vector3.new(3000,3000,3000)
else
    _G.flingy = Vector3.new(-25.05,0,-25.05)
end
if BULLETFLING == true and TORSOFLING == false then
    _G.bullet = true
else
    _G.bullet = false
end
if BULLETFLING == true and TORSOFLING == true then
    game.StarterGui:SetCore("SendNotification",{
		Title = "Snowmelt Hub",
		Text = "Bullet and torso will not work when both on.",
	})
	return
end
if game.Players.LocalPlayer.Character.Humanoid.RigType == Enum.HumanoidRigType.R6 and BULLETFLING == true and not game.Players.LocalPlayer.Character:FindFirstChild("Pal Hair") then
        game.StarterGui:SetCore("SendNotification",{
		Title = "Snowmelt Hub",
		Text = "R6 Bullet requires [Pal Hair]!",
	})
	return
end


if not _G.bullet then _G.bullet = false end
if not _G.flingy then _G.flingy = Vector3.new(-25.05,0,-25.05) end -- Vector3.new(3000,3000,3000)
if not game.CoreGui:FindFirstChild("SnowmeltUI") then
  Game.Players.LocalPlayer:Kick("nice try stealing the hub skid.")
  return
end
if game.Players.LocalPlayer.Character:FindFirstChild("Animation") then
	game.StarterGui:SetCore("SendNotification",{
		Title = "Snowmelt Hub",
		Text = "Already Reanimated!.",
	})
	return
end

local function att(p0,p1,p,o)
	for i, v in pairs(p0:GetChildren()) do
        if v:IsA("Motor6D") and v.Name ~= "Neck" then v:Destroy() end
	end
	Instance.new("AlignPosition", p0)
	Instance.new("AlignOrientation", p0)
	Instance.new("Attachment", p0)
	Instance.new("Attachment", p1)
	p0.AlignPosition.Attachment0 = p0.Attachment
	p0.AlignPosition.Attachment1 = p1.Attachment
	p0.AlignOrientation.Attachment0 = p0.Attachment
	p0.AlignOrientation.Attachment1 = p1.Attachment
	
	p0.AlignPosition.MaxForce = 99999999
	p0.AlignOrientation.MaxTorque = 99999999
	p0.AlignPosition.RigidityEnabled = false
	p0.AlignOrientation.RigidityEnabled = false
	p0.AlignOrientation.Responsiveness = 200
	p0.AlignPosition.Responsiveness = 200
	p0.Attachment.Position = p or Vector3.new(0,0,0)
	p0.Attachment.Orientation = o or Vector3.new(0,0,0)
	if p0:IsA("Accessory") then p0.Handle:BreakJoints() end
end

local ncloop; 
local flingloop;

local plr = game.Players.LocalPlayer
local char = plr.Character
local tor = char:FindFirstChild("Torso") or char:FindFirstChild("UpperTorso")
local srv = game:GetService("RunService")
local input = game:GetService("UserInputService")
local hum = char:FindFirstChild("Humanoid")

local cln = game:GetObjects('rbxassetid://8440552086')[1]
cln.Parent = char
cln.Name = "Animation"
local clnarm = cln:FindFirstChild("Right Arm")
local tor2 = cln:FindFirstChild("Torso")
local hum2 = cln:FindFirstChild("Humanoid")
for _,v in pairs(cln:GetDescendants()) do
	if v.ClassName == "Part" or v.ClassName == "Decal" then v.Transparency = 1 end
end
function vel()
	for _,v in pairs(char:GetChildren()) do
		if v.ClassName == "MeshPart" or v.ClassName == "Part" or v.ClassName == "BasePart" and v.Name ~= "Torso" and v.Name ~= "UpperTorso" then
			v.Velocity = Vector3.new(-25.05,0,-25.05)
		elseif v.ClassName == "Accessory" then
			v.Handle.Velocity = Vector3.new(-25.05,0,-25.05)
		end
	end
	tor.Velocity = _G.flingy
end
local function nc()
	for _,v in pairs(char:GetDescendants()) do
		if v.ClassName == "Part" or v.ClassName == "BasePart" or  v.ClassName == "MeshPart" then
			v.CanCollide = false
		end
	end
	hum2:Move(hum.MoveDirection, false)
	for _,v in pairs(hum:GetPlayingAnimationTracks()) do
		v:Stop()
	end
	settings().Rendering.EagerBulkExecution = true
	settings().Physics.AllowSleep = false
	settings().Physics.ThrottleAdjustTime = -math.huge
	plr.MaximumSimulationRadius=1000
	workspace.InterpolationThrottling = "Disabled"
	plr.ReplicationFocus = workspace
	sethiddenproperty(plr,"SimulationRadius",1000)
end

cln.HumanoidRootPart.CFrame = tor.CFrame
velloop = srv.Heartbeat:Connect(vel)
ncloop = srv.Stepped:Connect(nc)
input.JumpRequest:Connect(function()
	pcall(function()
		hum2.Jump = true
		hum2.Sit = false
	end)
end)
hum.Died:Connect(function()
	velloop:Disconnect()
	ncloop:Disconnect()
	cln:BreakJoints()
    _G.Reanimated = false
end)
--hum.Jump = true;hum2.Jump = true
wait(0.1)
if game.Players.LocalPlayer.Character.Humanoid.RigType == Enum.HumanoidRigType.R6 then
    local cf;
    cln.HumanoidRootPart.CFrame = char.Torso.CFrame
    char.Torso['Right Hip']:Destroy()
    char.Torso['Left Hip']:Destroy()
    char.Torso['Right Shoulder']:Destroy()
    char.Torso['Left Shoulder']:Destroy()
    char.HumanoidRootPart:Destroy()
        att(char['Torso'],cln['Torso'])
        att(char['Right Leg'],cln['Right Leg'])
        att(char['Left Leg'],cln['Left Leg'])
        att(char['Right Arm'],cln['Right Arm'])
        att(char['Left Arm'],cln['Left Arm'])
    function cfr()
        tor.CFrame = tor2.CFrame
    end
    cf = srv.RenderStepped:Connect(cfr)
    hum.Died:Connect(function()
        cf:Disconnect()
    end)
    local re = char.Animate
    local re2 = re:Clone()
    cln.Animate:Destroy()
    re2.Parent = cln
    re.Disabled = true
	if _G.bullet == true then
		hum:ChangeState("Physics")
		local faker = char:FindFirstChild("Pal Hair").Handle
		faker.AccessoryWeld:Destroy()
		faker.Mesh:Destroy()
		att(faker,cln["Right Arm"],Vector3.new(0,0,0),Vector3.new(90,0,0))
		char["Right Arm"].Name = "Bullet"
	end
else
    for _,v in pairs(hum:GetChildren()) do
        if v:IsA("NumberValue") then v:Destroy() end
    end
    local cf;
    local root = char:FindFirstChild("HumanoidRootPart")
    
        function cfr()
        tor.CFrame = tor2.CFrame * CFrame.new(0,0.19,0)
        root.CFrame = tor.CFrame * CFrame.new(0,-0.15,0)
    end
    cf = srv.Heartbeat:Connect(cfr)
    hum.Died:Connect(function()
        cf:Disconnect()
    end)
    cln.HumanoidRootPart.CFrame = root.CFrame
    wait(0.05)
    att(char.UpperTorso, cln['Torso'],Vector3.new(0, 0.15, 0))
    att(char.LowerTorso, cln['Torso'],Vector3.new(0, 0.75, 0))
    att(char.LeftUpperArm, cln['Left Arm'],Vector3.new(0, -0.405, 0)) 
    att(char.LeftLowerArm, cln['Left Arm'],Vector3.new(0, 0.18, 0))
    att(char.LeftHand, cln['Left Arm'],Vector3.new(0, 0.8, 0))
    att(char.RightUpperArm, cln['Right Arm'],Vector3.new(0, -0.405, 0))
    att(char.RightLowerArm, cln['Right Arm'],Vector3.new(0, 0.18, 0))
    att(char.RightHand, cln['Right Arm'],Vector3.new(0, 0.8, 0))
    att(char.LeftUpperLeg, cln['Left Leg'],Vector3.new(0, -0.6, 0))
    att(char.LeftLowerLeg, cln['Left Leg'],Vector3.new(0, 0.15, 0))
    att(char.LeftFoot, cln['Left Leg'],Vector3.new(0, 0.85, 0))
    att(char.RightUpperLeg, cln['Right Leg'],Vector3.new(0, -0.6, 0))
    att(char.RightLowerLeg, cln['Right Leg'],Vector3.new(0, 0.15, 0))
    att(char.RightFoot, cln['Right Leg'],Vector3.new(0, 0.85, 0))
    char.Animate.Disabled = true
    	if _G.bullet == true then
		hum:ChangeState("Physics")
		char["LowerTorso"].Name = "Bullet"
	end
end
wait(0.1)
_G.Reanimated = true
workspace.Camera.CameraSubject = hum2
game.StarterGui:SetCore("SendNotification",{
	Title = "Snowmelt Hub",
	Text = "Reanimated! Created by Gelatek.",
})
