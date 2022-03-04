if game.Players.LocalPlayer.Character:FindFirstChild("Reanimate") then
		game.StarterGui:SetCore("ChatMakeSystemMessage", {
			Text = "[Gelatek's Reanimate] You are already reanimated!",
			Color = Color3.fromRGB(255,255, 255),
			TextSize = 18,
		});
	return
elseif game.Players.LocalPlayer.Character.Humanoid.RigType == Enum.HumanoidRigType.R6 then
		game.StarterGui:SetCore("ChatMakeSystemMessage", {
			Text = "[Gelatek's Reanimate] R6 RigType Found. Please use R6 Reanimate Instead.",
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
end
Player = game.Players.LocalPlayer
Character = game.Players.LocalPlayer.Character
Character.Archivable = true
Character.Humanoid.BreakJointsOnDeath = false
local ReanimateCharacter = game:GetObjects("rbxassetid://8025310296")[1]
ReanimateCharacter.Parent = Character
ReanimateCharacter.Name = "Reanimate"
ReanimateCharacter.HumanoidRootPart.CFrame = Character.HumanoidRootPart.CFrame

local Dead = Instance.new("Model", workspace)
local DeadHead = Instance.new("Part", Dead);DeadHead.Name = "Head"
local DeadTorso = Instance.new("Part", Dead);DeadHead.Name = "UpperTorso"
local DeadHumanoid = Instance.new("Humanoid", Dead)
Player.Character = Dead
Player.Character.Humanoid.Name = "1"
local Clone = Player.Character:FindFirstChild("1"):Clone()
Clone.Parent = Player.Character
Clone.Name = "Humanoid"
Player.Character:FindFirstChild("1"):Destroy()
Player.Character.Humanoid.Health = 0
game.Players.LocalPlayer.Character = workspace[game:GetService("Players").LocalPlayer.Name]
--// ** NOCLIP ** \\ --
wait(5.65)
_G.Reanimated = true
Player.Character.Humanoid.Health = 0
ReanimateCharacter.Humanoid.BreakJointsOnDeath = false
_G.PermamentDeath = true
Dead:Destroy()

for i, v in pairs(Character:GetChildren()) do
	if v:IsA("Accessory") then
		v:Clone().Parent = ReanimateCharacter
	end
end

for i, v in pairs(ReanimateCharacter:GetDescendants()) do
	if v:IsA("BasePart") then
		v.Transparency = 1
	end
end

game.Players.LocalPlayer.Backpack:ClearAllChildren()
ReanimateCharacter.Head.face.Transparency = 1
ReanimateCharacter.Animate.Disabled = true
Character.Animate.Disabled = true
ReanimateCharacter.Humanoid.DisplayDistanceType = "None"

local NetlessTrigger
function Netless()
	if _G.Reanimated == false then
		NetlessTrigger:Disconnect()
		return
	end
	for i, v in pairs(Character:GetChildren()) do
		if v:IsA("Accessory") then
			v.Handle.Velocity = Vector3.new(35,0,0)
		elseif v:IsA("BasePart") then
			v.Velocity = Vector3.new(35,0,0)
		end
	end
end



local ResetBind = Instance.new("BindableEvent")
ResetBind.Event:connect(
    function()
        game:GetService("StarterGui"):SetCore("ResetButtonCallback", true)
        Player.Character = ReanimateCharacter
        ReanimateCharacter:Destroy()
        Player.Character = Character
        _G.Reanimated = false;_G.PermamentDeath = false
    end
)
game:GetService("StarterGui"):SetCore("ResetButtonCallback", ResetBind)


NetlessTrigger = game:GetService("RunService").Heartbeat:Connect(Netless) 


local Collision
function NoCollisions()
    if _G.Reanimated == false then
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

--\\ Inspired by pare lol //--
function Align(Part1,Part2,Position,Rotate)
	for i,v in pairs(Character[Part1]:GetChildren()) do
		if v:IsA('Motor6D') then 
			v:Destroy() 
		end
	end
AlignObject(Character[Part1],ReanimateCharacter[Part2],Position,Rotate)
end

Align('RightUpperArm','Right Arm',Vector3.new(0,-.4,0),Vector3.new(0,0,0))
Align('RightLowerArm','Right Arm',Vector3.new(0,.2,0),Vector3.new(0,0,0))
Align('RightHand','Right Arm',Vector3.new(0,.85,0),Vector3.new(0,0,0))
Align('LeftUpperArm','Left Arm',Vector3.new(0,-.4,0),Vector3.new(0,0,0))
Align('LeftLowerArm','Left Arm',Vector3.new(0,.2,0),Vector3.new(0,0,0))
Align('LeftHand','Left Arm',Vector3.new(0,.85,0),Vector3.new(0,0,0))
Align('LeftUpperLeg','Left Leg',Vector3.new(0,-.4,0),Vector3.new(0,0,0))
Align('LeftLowerLeg','Left Leg',Vector3.new(0,.2,0),Vector3.new(0,0,0))
Align('LeftFoot','Left Leg',Vector3.new(0,.85,0),Vector3.new(0,0,0))
Align('RightUpperLeg','Right Leg',Vector3.new(0,-.4,0),Vector3.new(0,0,0))
Align('RightLowerLeg','Right Leg',Vector3.new(0,.2,0),Vector3.new(0,0,0))
Align('RightFoot','Right Leg',Vector3.new(0,.85,0),Vector3.new(0,0,0))
Align('HumanoidRootPart','HumanoidRootPart',Vector3.new(0,0,0),Vector3.new(0,0,0))
Align('HumanoidRootPart','HumanoidRootPart',Vector3.new(0,0,0),Vector3.new(0,0,0))
Align('UpperTorso','Torso',Vector3.new(0,-.18,0),Vector3.new(0,0,0))
Align('LowerTorso','Torso',Vector3.new(0,.85,0),Vector3.new(0,0,0))
Align('Head','Head',Vector3.new(0,0,0),Vector3.new(0,0,0))

for i, v in pairs(Character:GetChildren()) do
	if v:IsA("Accessory") then
		v.Handle.AccessoryWeld:Remove()
        AlignObject(v.Handle, ReanimateCharacter[v.Name].Handle,Vector3.new(0,0,0),Vector3.new(0,0,0))
	end
end
local Humanoid = ReanimateCharacter:FindFirstChild("Humanoid")
workspace.Camera.CameraSubject = Humanoid
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

game.StarterGui:SetCore("ChatMakeSystemMessage", {
	Text = "[Gelatek's Reanimate] Successfully Reanimated R15 Rig!",
	Color = Color3.fromRGB(255,255, 255),
	TextSize = 18,
});
