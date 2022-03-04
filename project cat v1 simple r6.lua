--// Variables
local RunService = game:GetService("RunService")
local Player = game:GetService("Players").LocalPlayer
local Character = Player.Character
Character.Archivable = true
local ClonedCharacter = Character:Clone()

--// Main
ClonedCharacter.Archivable = true
ClonedCharacter.Parent = Character
ClonedCharacter.HumanoidRootPart.CFrame = Character.Torso.CFrame
ClonedCharacter.Name = "Dummy"

--// Hide Clone
for i, v in pairs(ClonedCharacter:GetDescendants()) do if v:IsA("BasePart") or v:IsA("Decal") then v.Transparency = 1 end end

--// Noclip
local NoClipTrigger
function Noclip()
	for i, v in pairs(Character:GetDescendants()) do
		if v:IsA("BasePart") then
			v.CanCollide = false
		end
	end
end

NoClipTrigger = RunService.Stepped:Connect(Noclip) 

--\\ Attaching
function Attachments(P0,P1)
local AlignPosition = Instance.new("AlignPosition", P0)
local AlignOrientation = Instance.new("AlignOrientation", P0)
local Attachment1 = Instance.new("Attachment", P0)
local Attachment2 = Instance.new("Attachment", P1)
AlignPosition.MaxForce = 9e9
AlignOrientation.MaxTorque = 9e9
AlignPosition.Responsiveness = 9e9
AlignOrientation.Responsiveness = 9e9

AlignPosition.Attachment0 = Attachment1
AlignOrientation.Attachment0 = Attachment1
AlignPosition.Attachment1 = Attachment2
AlignOrientation.Attachment1 = Attachment2

Attachment1.Position = Vector3.new(0,0,0)
Attachment1.Orientation = Vector3.new(0,0,0)
end

wait()

local Netlessing
--// Align
Character.Torso["Left Shoulder"]:Destroy();Character.Torso["Right Shoulder"]:Destroy();Character.Torso["Left Hip"]:Destroy();Character.Torso["Right Hip"]:Destroy()

Attachments(Character["Torso"],ClonedCharacter["Torso"]) 
Attachments(Character["Right Arm"],ClonedCharacter["Right Arm"])
Attachments(Character["Left Arm"],ClonedCharacter["Left Arm"])
Attachments(Character["Right Leg"],ClonedCharacter["Right Leg"])
Attachments(Character["Left Leg"],ClonedCharacter["Left Leg"])
--// No Hats for the clone.
for i, v in pairs (Character:GetChildren()) do
	if v:IsA("Accessory") then
		ClonedCharacter[v.Name]:Destroy()
	end
end
--// Movement
game:GetService("RunService").RenderStepped:Connect(function()
	if Character:FindFirstChild("Dummy") then
	for i, v in pairs(Character.Humanoid:GetPlayingAnimationTracks()) do
	   v:Stop()
	end
		ClonedCharacter:FindFirstChild("Humanoid"):Move(Character.Humanoid.MoveDirection, false)
	end
end)

game:GetService("UserInputService").JumpRequest:connect(function()
	if Character:FindFirstChild("Dummy") then
		if ClonedCharacter.Humanoid.FloorMaterial ~= Enum.Material.Air then
		   ClonedCharacter.Humanoid.Sit = false
		   ClonedCharacter.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
		end
	end
end)
--// Ending

workspace[game.Players.LocalPlayer.Name].Humanoid.Died:Connect(function()
	NoClipTrigger:Disconnect()
	Netlessing:Disconnect()
	game.Players.LocalPlayer.Character = Character
	ClonedCharacter:Remove()
	Character:BreakJoints()
	
end)

--// Netless
function Netless()
for i,v in next, workspace[game.Players.LocalPlayer.Name]:GetChildren() do
	if v:IsA("BasePart") then 
		game:GetService("RunService").Heartbeat:connect(function()
			if Character:FindFirstChild("Dummy") then
			v.Velocity = Vector3.new(0,-32.5,0)
		end
		end)
	elseif v:IsA("Accessory") then 
		
		game:GetService("RunService").Heartbeat:connect(function()
			if Character:FindFirstChild("Dummy") then
			v.Handle.Velocity = Vector3.new(0,-32.5,0)
		end
		end)
	end
end
end

Netlessing = RunService.Stepped:Connect(Netless)

Character.HumanoidRootPart:Destroy()
workspace.Camera.CameraSubject = ClonedCharacter.Humanoid
