
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
	Attachment1.Position = Position or Vector3.new(0,0,0)
	Attachment1.Orientation = Rotate or Vector3.new(0,0,0)
	if _G.DecreaseJitter == true then
		local a = Instance.new("BodyForce", Part0)
		a.Force = Vector3.new(80,80,80)
	end
end

Character = game.Players.LocalPlayer.Character
Character.Archivable = true
local ReanimateCharacter = game:GetObjects("rbxassetid://8025310296")[1]
ReanimateCharacter.Parent = Character
ReanimateCharacter.Name = "Dummy"
ReanimateCharacter.HumanoidRootPart.CFrame = Character.HumanoidRootPart.CFrame
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
--[[
game:GetService("RunService").Heartbeat:Connect(function()
	if Character.Humanoid.Health ~= 0 then
		Character.UpperTorso.CFrame = ReanimateCharacter.Torso.CFrame * CFrame.new(0,0.19,0)
	end
end)
]]--
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

NetlessTrigger = game:GetService("RunService").Heartbeat:Connect(Netless) 

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


