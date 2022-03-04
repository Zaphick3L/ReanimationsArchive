function Attachments(P0,P1,POS,ROT)
	local AlignPosition = Instance.new("AlignPosition", P0)
	local AlignOrientation = Instance.new("AlignOrientation", P0)
	local Attachment1 = Instance.new("Attachment", P0)
	local Attachment2 = Instance.new("Attachment", P1)
	AlignPosition.Attachment0 = Attachment1
	AlignOrientation.Attachment0 = Attachment1
	AlignPosition.Attachment1 = Attachment2
	AlignOrientation.Attachment1 = Attachment2
	AlignPosition.Responsiveness = 300
	AlignPosition.MaxForce = 5e9
	AlignOrientation.MaxTorque = 5e9
	AlignOrientation.Responsiveness = 300
	AlignOrientation.ReactionTorqueEnabled = false
	Attachment1.Position = POS or Vector3.new(0,0,0)
	Attachment1.Orientation = ROT or Vector3.new(0,0,0)
end

local Character = workspace[game.Players.LocalPlayer.Name]
local OGTorso = Character:FindFirstChild("Torso")
Character.Archivable = true
local CharacterClone = Character:Clone()
CharacterClone.Humanoid.DisplayDistanceType = "None"
CharacterClone.Parent = Character
CharacterClone.Name = "Dummy"
for i, v in pairs(CharacterClone:GetDescendants()) do if v:IsA("BasePart") or v:IsA("Decal") then v.Transparency = 1 end end
_G.Reanimated = true;_G.BotReanimated = true
workspace.Camera.CameraSubject = CharacterClone.Humanoid

game.Players.LocalPlayer.Character["Pal Hair"].Handle.Mesh:Destroy()
game.Players.LocalPlayer.Character["Kate Hair"].Handle.Mesh:Destroy()
game.Players.LocalPlayer.Character["Pink Hair"].Handle.Mesh:Destroy()
game.Players.LocalPlayer.Character["LavanderHair"].Handle.Mesh:Destroy()
game.Players.LocalPlayer.Character["Robloxclassicred"].Handle.Mesh:Destroy()
game.Players.LocalPlayer.Character["Hat1"].Handle.Mesh:Destroy()
Character.Archivable = true
local Torso1 = Character["Pal Hair"]
Torso1.Handle.AccessoryWeld:Destroy()
local Torso2 = Character["Robloxclassicred"]
Torso2.Handle.AccessoryWeld:Destroy()
local LeftArm = Character.Hat1
LeftArm.Handle.AccessoryWeld:Destroy()
local RightArm = Character["Kate Hair"]
RightArm.Handle.AccessoryWeld:Destroy()
local LeftLeg = Character["Pink Hair"]
LeftLeg.Handle.AccessoryWeld:Destroy()
local RightLeg = Character.LavanderHair
RightLeg.Handle.AccessoryWeld:Destroy()
local Head = Character.MediHood
Head.Handle.AccessoryWeld:Destroy()

Attachments(Torso1.Handle, CharacterClone["Torso"], Vector3.new(0.5, 0, 0), Vector3.new(90, 0, 0))
Attachments(Torso2.Handle, CharacterClone["Torso"], Vector3.new(-0.5, 0, 0), Vector3.new(90, 0, 0))
Attachments(LeftArm.Handle, CharacterClone["Left Arm"], Vector3.new(0, 0, 0), Vector3.new(90, 0, 0))
Attachments(RightArm.Handle, CharacterClone["Right Arm"], Vector3.new(0, 0, 0), Vector3.new(90, 0, 0))
Attachments(LeftLeg.Handle, CharacterClone["Left Leg"], Vector3.new(0, 0, 0), Vector3.new(90, 0, 0))
Attachments(RightLeg.Handle, CharacterClone["Right Leg"], Vector3.new(0, 0, 0), Vector3.new(90, 0, 0))
Attachments(Head.Handle, CharacterClone["Head"], Vector3.new(0, 0, -0.2), Vector3.new(0, 0, 0))
_G.BotReanim = true

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
local Netlessing
local Collision
function NoCollisions()
   Character.Humanoid.Died:Connect(function()
   _G.Reanimated = false
   	Netlessing:Disconnect()
   _G.BotReanim = false
   wait(5.65)
   Collision:Disconnect()

   return end)
   for i, v in pairs(Character:GetDescendants()) do
      if v:IsA("BasePart") then
         v.CanCollide = false
      end
   end
end
Collision = game:GetService("RunService").Stepped:Connect(NoCollisions)

Character.Humanoid.WalkSpeed = 0
Character.Humanoid.JumpPower = 0
Character.HumanoidRootPart:Destroy()
function Netless()
for i,v in next, workspace[game.Players.LocalPlayer.Name]:GetChildren() do
		if v:IsA("BasePart") then 
			v.Velocity = Vector3.new(0,-32.5,0)
		elseif v:IsA("Accessory") then 
			v.Handle.Velocity = Vector3.new(0,-32.5,0)
		end
	end
end

Netlessing = game:GetService("RunService").Heartbeat:Connect(Netless)
