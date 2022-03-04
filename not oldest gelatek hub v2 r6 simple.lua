if game.Players.LocalPlayer.Character:FindFirstChild("Reanimate") then
		game.StarterGui:SetCore("ChatMakeSystemMessage", {
			Text = "[Gelatek's Reanimate] You are already reanimated!",
			Color = Color3.fromRGB(255,255, 255),
			TextSize = 18,
		});
	return
elseif game.Players.LocalPlayer.Character.Humanoid.RigType == Enum.HumanoidRigType.R15 then
		game.StarterGui:SetCore("ChatMakeSystemMessage", {
			Text = "[Gelatek's Reanimate] R15 RigType Found. Please use R15 Reanimate Instead.",
			Color = Color3.fromRGB(255,255, 255),
			TextSize = 18,
		});
	return
end

function AlignObject(Part0,Part1,Position,Rotate)
	local AlignPosition = Instance.new("AlignPosition", Part0)
	local AlignOrientation = Instance.new("AlignOrientation", Part0)
	local Attachment1 = Instance.new("Attachment", Part0)
	local Attachment2 = Instance.new("Attachment", Part1)
	AlignPosition.Attachment0 = Attachment1
	AlignOrientation.Attachment0 = Attachment1
	AlignPosition.Attachment1 = Attachment2
	AlignOrientation.Attachment1 = Attachment2
	AlignPosition.Responsiveness = 300
	AlignPosition.MaxForce = 5e9
	AlignOrientation.MaxTorque = 5e9
	AlignOrientation.Responsiveness = 300
	AlignOrientation.PrimaryAxisOnly = false
	AlignPosition.RigidityEnabled = true
	AlignOrientation.RigidityEnabled = true
	Attachment1.Position = Position or Vector3.new(0,0,0)
	Attachment1.Orientation = Rotate or Vector3.new(0,0,0)
	game:GetService("RunService").Heartbeat:Connect(function()
	Part0.Velocity = Vector3.new(29.99,0,0)
	end)
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
AlignObject(Character.Torso,CharacterClone.Torso)
AlignObject(Character.Head,CharacterClone.Head)
AlignObject(Character["Right Arm"],CharacterClone["Right Arm"])
AlignObject(Character["Left Arm"],CharacterClone["Left Arm"])
AlignObject(Character["Right Leg"],CharacterClone["Right Leg"])
AlignObject(Character["Left Leg"],CharacterClone["Left Leg"])
for i ,v in pairs(Character:GetChildren()) do
	if v:IsA("Accessory") then
		v.Handle.AccessoryWeld:Destroy()
		AlignObject(v.Handle,CharacterClone[v.Name].Handle)
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
Character.HumanoidRootPart:Destroy()

game.StarterGui:SetCore("ChatMakeSystemMessage", {
	Text = "[Gelatek's Reanimate] Successfully Reanimated R6 Rig!",
	Color = Color3.fromRGB(255,255, 255),
	TextSize = 18,
});
