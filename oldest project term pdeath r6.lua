
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
    local Humanoid = CharacterClone.Humanoid
    CharacterClone.Parent = Character
    CharacterClone.Name = "Reanimate"
    Character.Humanoid.BreakJointsOnDeath = false
        for k,Parts in pairs(CharacterClone:GetDescendants()) do
         if Parts:IsA("BasePart") or Parts:IsA("Decal") then 
            Parts.Transparency = 1
        end 
    end
    CharacterClone.Humanoid.DisplayDistanceType = "None"
    local FakeCharacter = Instance.new("Model", workspace); FakeCharacter.Name = "DeadChar"
    Instance.new("Part", FakeCharacter).Name = "Head" 
    Instance.new("Part", FakeCharacter).Name = "Torso"
    Instance.new("Humanoid", FakeCharacter).Name = "Humanoid"
    FakeCharacter.Head.Transparency = 1
    FakeCharacter.Torso.Transparency = 1
        for k,Parts in pairs(CharacterClone:GetDescendants()) do
         if Parts:IsA("BasePart") or Parts:IsA("Decal") then 
            Parts.Transparency = 1
        end 
    end
    FakeCharacter.Humanoid.DisplayDistanceType = "None"
    Character.Humanoid.WalkSpeed = 0
    Character.Humanoid.JumpPower = 0
    game:GetService("Players").LocalPlayer["Character"] = FakeCharacter
    game:GetService("Players").LocalPlayer["Character"].Humanoid.Name = "FalseHumanoid"
    local Clone = game:GetService("Players").LocalPlayer["Character"]:FindFirstChild("FalseHumanoid"):Clone()
    Clone.Parent = game:GetService("Players").LocalPlayer["Character"]
    Clone.Name = "Humanoid"
    game:GetService("Players").LocalPlayer["Character"]:FindFirstChild("FalseHumanoid"):Destroy() 
    game:GetService("Players").LocalPlayer["Character"].Humanoid.Health = 0 
    game:GetService("Players").LocalPlayer["Character"] = workspace[game:GetService("Players").LocalPlayer.Name] 
    wait(5.65)
    _G.PermamentDeath = true
    workspace.Camera.CameraSubject = Humanoid
    CharacterClone.HumanoidRootPart.CFrame = Character.HumanoidRootPart.CFrame * CFrame.new(0,2,0)
    FakeCharacter:Destroy()
    game:GetService("Players").LocalPlayer["Character"].Humanoid.Health = 0
    CharacterClone.Humanoid.BreakJointsOnDeath = false
    game:GetService("Players").LocalPlayer["Character"].Humanoid.BreakJointsOnDeath = false

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
if Character:FindFirstChild("Reanimate") then
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
local resetBindable = Instance.new("BindableEvent")
    resetBindable.Event:connect(function()
        game:GetService("StarterGui"):SetCore("ResetButtonCallback", true)
        resetBindable:Destroy()
        local Player = game.Players.LocalPlayer
        Player.Character = CloneCharacter
        CharacterClone:Destroy()
        Player.Character = Character
        CloneCharacter.Humanoid.Health = 0
        _G.Reanimated = false  
        _G.PermamentDeath = false
        dead = true
end)
game:GetService("StarterGui"):SetCore("ResetButtonCallback", resetBindable)

local Humanoid = CharacterClone:FindFirstChild("Humanoid")
    game:GetService("UserInputService").JumpRequest:connect(function()
        if Humanoid.FloorMaterial ~= Enum.Material.Air then 
            Humanoid:ChangeState(Enum.HumanoidStateType.Jumping) Humanoid.Sit = false 
        end 
    end)
    game:GetService('RunService').RenderStepped:Connect(function()
        Humanoid:Move(Character.Humanoid.MoveDirection, false)
        local AnimationTracks = Character.Humanoid:GetPlayingAnimationTracks()
            for n,Anims in pairs(AnimationTracks) do 
                Anims:Stop()
         end 
    end)


local Collision
function NoCollisions()
if CharacterClone:FindFirstChild("Humanoid") == 0 then Collision:Disconnect(); return end
	for i, v in pairs(Character:GetChildren()) do
		if v:IsA("BasePart") then
			v.CanCollide = false
		end 
	end
end
Collision = game:GetService("RunService").Stepped:Connect(NoCollisions)
