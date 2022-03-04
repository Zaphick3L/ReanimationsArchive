if workspace[game.Players.LocalPlayer.Name]:FindFirstChild("Reanimate") then print('no') return end
function AlignObject(Part0,Part1)
	local AlignPosition = Instance.new("AlignPosition", Part0)
	local AlignOrientation = Instance.new("AlignOrientation", Part0)
	local Attachment1 = Instance.new("Attachment", Part0)
	local Attachment2 = Instance.new("Attachment", Part1)
	AlignPosition.Attachment0 = Attachment1
	AlignOrientation.Attachment0 = Attachment1
	AlignPosition.Attachment1 = Attachment2
	AlignOrientation.Attachment1 = Attachment2
	AlignPosition.Responsiveness = 300
	AlignPosition.MaxForce = 1395730
	AlignOrientation.MaxTorque = 1395730
	AlignOrientation.Responsiveness = 300
	AlignOrientation.PrimaryAxisOnly = false
	AlignPosition.RigidityEnabled = true
	AlignOrientation.RigidityEnabled = true
	Attachment1.Position = Vector3.new(0,0,0)
	Attachment1.Orientation = Vector3.new(0,0,0)
end
local Character = game.Players.LocalPlayer.Character
Character.Archivable = true
local ReanimateCharacter = Character:Clone()
ReanimateCharacter.Name = "Reanimate"
ReanimateCharacter.Parent = Character
workspace.Camera.CameraSubject = ReanimateCharacter.Humanoid
Character.Torso["Left Shoulder"]:Destroy()
Character.Torso["Right Shoulder"]:Destroy()
Character.Torso["Left Hip"]:Destroy()
Character.Torso["Right Hip"]:Destroy()
Character.HumanoidRootPart.RootJoint:Destroy()
AlignObject(Character["Head"],ReanimateCharacter["Head"])
AlignObject(Character["Torso"],ReanimateCharacter["Torso"])
AlignObject(Character["HumanoidRootPart"],ReanimateCharacter["HumanoidRootPart"])
AlignObject(Character["Right Arm"],ReanimateCharacter["Right Arm"])
AlignObject(Character["Left Arm"],ReanimateCharacter["Left Arm"])
AlignObject(Character["Right Leg"],ReanimateCharacter["Right Leg"])
AlignObject(Character["Left Leg"],ReanimateCharacter["Left Leg"])
for i, v in pairs(ReanimateCharacter:GetDescendants()) do 
if v:IsA("BasePart") or v:IsA("Decal") then v.Transparency = 1 end
end
local Collider
function Noclip()
	Character.Humanoid.Died:Connect(function() Collider:Disconnect() return end)
	for i, v in pairs(Character:GetDescendants()) do
		if v:IsA("BasePart") then
			v.CanCollide = false
		end
	end
end
Collider = game:GetService("RunService").Stepped:Connect(Noclip) 
local NetlessTrigger
function Netless()
	Character.Humanoid.Died:Connect(function()
		NetlessTrigger:Disconnect()
		return
	end)
	for i, v in pairs(Character:GetChildren()) do
		if v:IsA("Accessory") then
			v.Handle.Velocity = Vector3.new(35,0,0)
		elseif v:IsA("BasePart") and v.Name ~= "Torso" then
			v.Velocity = Vector3.new(35,0,0)
		end
	end
	if _G.TorsoFling == true then
		Character.Torso.Velocity = Vector3.new(11000,150,0)
	else
		Character.Torso.Velocity = Vector3.new(35,0,0)
	end
end
NetlessTrigger = game:GetService("RunService").Heartbeat:Connect(Netless) 
game:GetService("UserInputService").JumpRequest:connect(function()
if ReanimateCharacter.Humanoid.FloorMaterial ~= Enum.Material.Air then 
ReanimateCharacter.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
ReanimateCharacter.Humanoid.Sit = false 
end 
end)
game:GetService("RunService").RenderStepped:Connect(function()
    ReanimateCharacter.Humanoid:Move(Character.Humanoid.MoveDirection, false)
    for i, v in pairs(Character.Humanoid:GetPlayingAnimationTracks()) do v:Stop() end
end)
