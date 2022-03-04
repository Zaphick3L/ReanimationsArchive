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



--// ** STARTUP ** \\--
local Character = workspace[game.Players.LocalPlayer.Name]
Character.Humanoid.WalkSpeed = 0
Character.Humanoid.JumpPower = 0
local Player = game.Players.LocalPlayer
local Alt = game.Players.LocalPlayer.Character
Character.Archivable = true
Character.Humanoid.BreakJointsOnDeath = false
local CharClone = Character:Clone()
CharClone.Name = "Reanimate"
CharClone.Parent = Character
-- // ** HIDE COPY ** \\ -- 
for i, v in pairs(CharClone:GetDescendants()) do if v:IsA("BasePart") or v:IsA("Decal") then v.Transparency = 1 end end
-- // ** PDEATH SETUP ** \\ --
local Dead = Instance.new("Model", workspace)
local DeadHead = Instance.new("Part", Dead);DeadHead.Name = "Head"
local DeadTorso = Instance.new("Part", Dead);DeadHead.Name = "Torso"
local DeadHumanoid = Instance.new("Humanoid", Dead)
Player.Character = Dead
_G.RNoClip = true;
Player.Character.Humanoid.Name = "1"
local Clone = Player.Character:FindFirstChild("1"):Clone()
Clone.Parent = Player.Character
Clone.Name = "Humanoid"
Player.Character:FindFirstChild("1"):Destroy()
Player.Character.Humanoid.Health = 0
game.Players.LocalPlayer.Character = workspace[game:GetService("Players").LocalPlayer.Name]
--// ** NOCLIP ** \\ --
local Collision
function NoCollisions()
    if _G.RNoClip == false then
        Collision:Disconnect()
        return
    end
    for i, v in pairs(Character:GetChildren()) do
        if v:IsA("BasePart") then
            v.CanCollide = false
        end
    end
end
Collision = game:GetService("RunService").Stepped:Connect(NoCollisions)
wait(5.65)
Player.Character.Humanoid.Health = 0
CharClone.Humanoid.BreakJointsOnDeath = false
_G.PermamentDeath = true
Dead:Destroy()
--// ** ALIGN/ATTACHMENT DESTROYING ** \\--
Character.Torso["Left Shoulder"]:Destroy()
Character.Torso["Right Shoulder"]:Destroy()
Character.Torso["Left Hip"]:Destroy()
Character.Torso["Right Hip"]:Destroy()
Character.HumanoidRootPart["RootJoint"]:Destroy()

Character.Humanoid.WalkSpeed = 16
Character.Humanoid.JumpPower = 50

CharClone.Humanoid.WalkSpeed = 16
CharClone.Humanoid.JumpPower = 50

AlignObject(Character.Torso, CharClone.Torso)
AlignObject(Character.Head, CharClone.Head)
AlignObject(Character["Right Arm"], CharClone["Right Arm"])
AlignObject(Character["Left Arm"], CharClone["Left Arm"])
AlignObject(Character["Right Leg"], CharClone["Right Leg"])
AlignObject(Character["Left Leg"], CharClone["Left Leg"])
AlignObject(Character.HumanoidRootPart, CharClone.HumanoidRootPart)
_G.Reanimated = true;_G.PermamentDeath = true;
for i, v in pairs(Character:GetChildren()) do
    if v:IsA("Accessory") then
    	v.Handle.AccessoryWeld:Remove()
        AlignObject(v.Handle, CharClone[v.Name].Handle)
    end
end
--// ** JUMPING AND MOVEMENT ** \\--
local Humanoid = CharClone:FindFirstChild("Humanoid")
game:GetService("UserInputService").JumpRequest:connect(
    function()
        if Humanoid.FloorMaterial ~= Enum.Material.Air then
            Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
            Humanoid.Sit = false
        end
    end
)
game:GetService("RunService").RenderStepped:Connect(
    function()
        Humanoid:Move(Character.Humanoid.MoveDirection, false)
        local AnimationTracks = Character.Humanoid:GetPlayingAnimationTracks()
        for n, Anims in pairs(AnimationTracks) do
            Anims:Stop()
        end
        Character:FindFirstChild("Humanoid").WalkSpeed = Humanoid.WalkSpeed
        Character:FindFirstChild("Humanoid").JumpPower = Humanoid.JumpPower
    end
)
--// ** ENDING ** \\--
local ResetBind = Instance.new("BindableEvent")
ResetBind.Event:connect(
    function()
        game:GetService("StarterGui"):SetCore("ResetButtonCallback", true)
        Player.Character = CharClone
        CharClone:Destroy()
        Player.Character = Character
        _G.Reanimated = false;_G.PermamentDeath = false;_G.RNoClip = false
    end
)
game:GetService("StarterGui"):SetCore("ResetButtonCallback", ResetBind)
game.StarterGui:SetCore("ChatMakeSystemMessage", {
	Text = "[Gelatek's Reanimate] Successfully Reanimated R6 Rig!",
	Color = Color3.fromRGB(255,255, 255),
	TextSize = 18,
});
