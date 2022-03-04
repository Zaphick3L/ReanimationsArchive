
local function Align(part0,part1)
local attachmentpos = Instance.new("AlignPosition", part0)
local attachmentori = Instance.new("AlignOrientation", part0)
local attachment1 = Instance.new("Attachment", part0)
local attachment2 = Instance.new("Attachment", part1)
attachmentpos.MaxForce = 4900570
attachmentpos.Responsiveness = 205
attachmentpos.RigidityEnabled = true
attachmentpos.MaxVelocity = math.huge
attachmentpos.ReactionForceEnabled = false
attachmentpos.ApplyAtCenterOfMass = true
attachmentori.MaxTorque = 4900570
attachmentori.Responsiveness = 205
attachmentori.MaxAngularVelocity = math.huge
attachmentori.ReactionTorqueEnabled = false
attachmentori.PrimaryAxisOnly = false
attachment1.Position = Vector3.new(0,0,0)
attachment1.Orientation = Vector3.new(0,0,0)
attachmentpos.Attachment0 = part0.Attachment
attachmentori.Attachment0 = part0.Attachment
attachmentpos.Attachment1 = part1.Attachment
attachmentori.Attachment1 = part1.Attachment
end

local Character = workspace[game.Players.LocalPlayer.Name]
local OGTorso = Character:FindFirstChild("Torso")
Character.Archivable = true
local CharacterClone = Character:Clone()
CharacterClone.Humanoid.DisplayDistanceType = "None"
CharacterClone.Parent = Character
CharacterClone.Name = "Reanimate"
for i, v in pairs(CharacterClone:GetDescendants()) do
	if v:IsA("BasePart") or v:IsA("Decal") then
		v.Transparency = 1
	end
end
_G.Reanimated = true
game:GetService("RunService").Heartbeat:Connect(function()
Character:FindFirstChild("HumanoidRootPart").Velocity = _G.Velocity
	if _G.TorsoFling == true then 
		OGTorso.Velocity = Vector3.new(6000,6000,6000) 
	elseif _G.TorsoFling == false then
		OGTorso.Velocity = _G.Velocity 
	end
Character.Head.Velocity = _G.Velocity
Character:FindFirstChild("Right Arm").Velocity = _G.Velocity
Character:FindFirstChild("Right Leg").Velocity = _G.Velocity
Character:FindFirstChild("Left Arm").Velocity = _G.Velocity
Character:FindFirstChild("Left Leg").Velocity = _G.Velocity
for i ,v in pairs(Character:GetChildren()) do
	if v:IsA("Accessory") then
		v.Handle.Velocity = _G.Velocity
	end
end
local CloneTorso = CharacterClone:FindFirstChild("Torso")
if _G.Reanimated == true then
OGTorso.CFrame = CloneTorso.CFrame
end
end) 
workspace.Camera.CameraSubject = CharacterClone.Humanoid
Character.Torso["Left Shoulder"]:Destroy()
Character.Torso["Right Shoulder"]:Destroy()
Character.Torso["Left Hip"]:Destroy()
Character.Torso["Right Hip"]:Destroy()
Character.HumanoidRootPart["RootJoint"]:Destroy()
Align(Character.Torso,CharacterClone.Torso)
Align(Character.Head,CharacterClone.Head)
Align(Character["Right Arm"],CharacterClone["Right Arm"])
Align(Character["Left Arm"],CharacterClone["Left Arm"])
Align(Character["Right Leg"],CharacterClone["Right Leg"])
Align(Character["Left Leg"],CharacterClone["Left Leg"])
Align(Character.HumanoidRootPart,CharacterClone.HumanoidRootPart)
for i ,v in pairs(Character:GetChildren()) do
	if v:IsA("Accessory") then
		Align(v.Handle,CharacterClone[v.Name].Handle)
	end
end
game:GetService("RunService").RenderStepped:Connect(function()
	for i, v in pairs(Character.Humanoid:GetPlayingAnimationTracks()) do
		v:Stop()
	end
	CharacterClone.Humanoid:Move(Character.Humanoid.MoveDirection, false)
end)
game:GetService("UserInputService").JumpRequest:connect(function()
	if CharacterClone.Humanoid.FloorMaterial ~= Enum.Material.Air then 
		CharacterClone.Humanoid.Sit = false
		CharacterClone.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
	end
end)
local Collision
function NoCollisions()
Character.Humanoid.Died:Connect(function() 
Collision:Disconnect() 
_G.Reanimated = false
return end)
	for i, v in pairs(Character:GetChildren()) do
		if v:IsA("BasePart") then
			v.CanCollide = false
		end 
	end
end
Collision = game:GetService("RunService").Stepped:Connect(NoCollisions)
