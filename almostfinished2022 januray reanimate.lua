 _G.Settings = {
	Velocity = Vector3.new(30,0,0),
	Bullet = true,
	Fling = false,
}
pcall(function()
    setfpscap(75)
end)

--[[ 
This is last reanimation rewrite, all the bugs i did, i'm no longer doing them
This is my most stable reanimation im ever making right now.

Goals:
- Optimize Code
- Not try to recopy the code.
- Stable Velocity
- Permament Death (player = nil then back to normal)
- Simple Fling
- Bugless.
- Decent Align.
- GetObjects Dummy

game:GetObjects('rbxassetid://8440552086')[1]

]]--

function Align(Part0,Part1,Position,Orientation)
	local AlignPosition = Instance.new("AlignPosition",Part0)
	local AlignOrientation = Instance.new("AlignOrientation",Part0)
	local Attachment1 = Instance.new("Attachment",Part0)
	local Attachment2 = Instance.new("Attachment",Part1)
	AlignPosition.MaxForce,AlignOrientation.MaxTorque = 9e9,9e9 -- MaxTorque
	AlignPosition.Responsiveness,AlignOrientation.Responsiveness = 200,200 -- Responsiveness
	AlignPosition.Attachment0,AlignPosition.Attachment1 = Attachment1,Attachment2 -- AlignPos Config
	AlignOrientation.Attachment0,AlignOrientation.Attachment1 = Attachment1,Attachment2 -- AlignOri Config
	Attachment1.Position = Position or Vector3.new(0,0,0) -- Position
	Attachment1.Orientation = Orientation or Vector3.new(0,0,0) -- Orientation
end

function AlignR15(Part0,Part1,Position,Orientation)
	for _,v in pairs(Part0:GetChildren()) do
		if v:IsA("Motor6D") and v.Name ~= "Neck" then
			v:Destroy()
		end
	end
	Align(Part0,Part1,Position,Orientation)
end

-- Beginning
local UIS = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local Player = game:GetService("Players").LocalPlayer
local Character = Player.Character
local Humanoid = Character:FindFirstChild("Humanoid")
local Torso = Character:FindFirstChild("Torso") or Character:FindFirstChild("UpperTorso")
local Root = Character:FindFirstChild("HumanoidRootPart")
local Dead = false
local Noclip;
local Netless;
-- Startup
Character.Archivable = true
local Reanimate = game:GetObjects('rbxassetid://8440552086')[1]
Reanimate.Parent = Character
Reanimate.Name = "Rig" -- name by DankPog
local CloneHumanoid = Reanimate:FindFirstChild("Humanoid")
local CloneTorso = Reanimate:FindFirstChild("Torso") or Reanimate:FindFirstChild("UpperTorso")
for _, v in pairs(Reanimate:GetDescendants()) do
	if v:IsA("BasePart") or v:IsA("Decal") then
		v.Transparency = 1
	end
end
function NoclipF()
	for _, v in pairs(Character:GetDescendants()) do
		if v:IsA("BasePart") or v:IsA("MeshPart") then
			v.CanCollide = false
		end
	end
	CloneHumanoid:Move(Humanoid.MoveDirection)
	for _,v in pairs(Humanoid:GetPlayingAnimationTracks()) do
		v:Stop()
	end
end
Character.Animate.Disabled = true
Noclip = RunService.Stepped:Connect(NoclipF)
function NetlessF()
	for _, v in pairs(Character:GetChildren()) do
		if v:IsA("BasePart") or v:IsA("MeshPart") and v.Name ~= "UpperTorso" and v.Name ~= "Torso" then
			v.Velocity = _G.Settings.Velocity
		elseif v:IsA("Accessory") then
			v.Handle.Velocity = _G.Settings.Velocity
		end
	end
	if Humanoid.RigType == Enum.HumanoidRigType.R15 then
		Root.CFrame = CloneTorso.CFrame
	end
	if _G.Settings.Fling == true then
		Torso.Velocity = Vector3.new(3000,3000,3000)
		if Humanoid.RigType == Enum.HumanoidRigType.R15 then
			Torso.CFrame = CloneTorso.CFrame + Vector3.new(0,0.19,0)
		else
			Torso.CFrame = CloneTorso.CFrame
		end
	else
		Torso.Velocity = _G.Settings.Velocity
	end
end
Netless = RunService.Heartbeat:Connect(NetlessF)

UIS.JumpRequest:Connect(function()
	pcall(function()
		CloneHumanoid.Jump = true
		CloneHumanoid.Sit = false
	end)
end)

Humanoid.Died:Connect(function()
Dead = true
Noclip:Disconnect()
Netless:Disconnect()
Reanimate:BreakJoints()
workspace.Camera.CameraSubject = Humanoid
end)

if Humanoid.RigType == Enum.HumanoidRigType.R6 then
Reanimate.HumanoidRootPart.CFrame = Torso.CFrame
Character.Torso["Left Shoulder"]:Destroy()
Character.Torso["Right Shoulder"]:Destroy()
Character.Torso["Left Hip"]:Destroy()
Character.Torso["Right Hip"]:Destroy()
Character.HumanoidRootPart:Destroy()
Align(Character.Torso,Reanimate.Torso)
Align(Character['Right Arm'],Reanimate['Right Arm'])
Align(Character['Left Arm'],Reanimate['Left Arm'])
Align(Character['Right Leg'],Reanimate['Right Leg'])
Align(Character['Left Leg'],Reanimate['Left Leg'])

if _G.Settings.Bullet == true then
    Humanoid:ChangeState("Physics")
    local Hat = Character:FindFirstChild("Pal Hair").Handle
    Hat.AccessoryWeld:Destroy()
    Hat.Mesh:Destroy()
    Align(Hat,Reanimate["Right Arm"],Vector3.new(0,0,0),Vector3.new(90,0,0))
    Character["Right Arm"].Name = "Bullet"
end
Reanimate.Animate:Destroy()
local Animate = Character.Animate:Clone()
Animate.Parent = Reanimate
Animate.Disabled = false
elseif Humanoid.RigType == Enum.HumanoidRigType.R15 then
	
Reanimate.HumanoidRootPart.CFrame = Torso.CFrame
AlignR15(Character.UpperTorso, Reanimate['Torso'],Vector3.new(0, -0.19, 0))
AlignR15(Character.LowerTorso, Reanimate['Torso'],Vector3.new(0, 0.75, 0))



AlignR15(Character.LeftUpperArm, Reanimate['Left Arm'],Vector3.new(0, -0.405, 0)) 
AlignR15(Character.LeftLowerArm, Reanimate['Left Arm'],Vector3.new(0, 0.18, 0))
AlignR15(Character.LeftHand, Reanimate['Left Arm'],Vector3.new(0, 0.8, 0))

AlignR15(Character.RightUpperArm, Reanimate['Right Arm'],Vector3.new(0, -0.405, 0))
AlignR15(Character.RightLowerArm, Reanimate['Right Arm'],Vector3.new(0, 0.18, 0))
AlignR15(Character.RightHand, Reanimate['Right Arm'],Vector3.new(0, 0.8, 0))

AlignR15(Character.LeftUpperLeg, Reanimate['Left Leg'],Vector3.new(0, -0.6, 0))
AlignR15(Character.LeftLowerLeg, Reanimate['Left Leg'],Vector3.new(0, 0.15, 0))
AlignR15(Character.LeftFoot, Reanimate['Left Leg'],Vector3.new(0, 0.85, 0))


AlignR15(Character.RightUpperLeg, Reanimate['Right Leg'],Vector3.new(0, -0.6, 0))
AlignR15(Character.RightLowerLeg, Reanimate['Right Leg'],Vector3.new(0, 0.15, 0))
AlignR15(Character.RightFoot, Reanimate['Right Leg'],Vector3.new(0, 0.85, 0))

AlignR15(Character.HumanoidRootPart, Reanimate['HumanoidRootPart'])
if _G.Settings.Bullet == true then
    Humanoid:ChangeState("Physics")
    Character["RightLowerLeg"].Name = "Bullet"
end
end
workspace.Camera.CameraSubject = CloneHumanoid
game.StarterGui:SetCore("SendNotification",{
    Title = "Gelatek Reanimate",
    Text = "Reanimated.",
})
