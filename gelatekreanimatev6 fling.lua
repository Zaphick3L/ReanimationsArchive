
	game.StarterGui:SetCore("ChatMakeSystemMessage", {
		Text = "[Gelatek Reanimate]: Successfully Reanimated! (Fling)",
		Color = Color3.fromRGB(150, 255, 93),
		TextSize = 18,
	});



if not _G.Velocity then _G.Velocity = Vector3.new(35,0,0) end
if game.Players.LocalPlayer.Character:FindFirstChild("GelatekReanim") then
	print("Already Reanimated")
	return
end
local Character = game.Players.LocalPlayer.Character
for i,v in pairs(Character:GetChildren()) do
	if v:IsA("BasePart") then game:GetService("RunService").Heartbeat:Connect(function() 
			v.Velocity = _G.Velocity

		end)
	elseif v:IsA("Accessory") then game:GetService("RunService").Heartbeat:Connect(function() 
			pcall(function() v.Handle.Velocity = _G.Velocity; 
				if Character.Humanoid.RigType == Enum.HumanoidRigType.R15 then
					Character.HumanoidRootPart.RotVelocity = Vector3.new(1250,1250,1250) 
				else
					Character.Torso.RotVelocity = Vector3.new(2100,2100,2100) 
				end
			end)
		end)
	end
end

Character.Archivable = true
Character.HumanoidRootPart.Anchored = true
wait(0.05)
Character.Animate.Disabled = true
Character.HumanoidRootPart.Anchored = false
pcall(function()
	for i, v in pairs(Character.Humanoid:GetChildren()) do if v:IsA("NumberValue") then v:Destroy() end end
end)
local Reanim = game:GetObjects('rbxassetid://8440552086')[1]
Reanim.Parent = Character
Reanim.Name = "GelatekReanim"
for i, v in pairs(Reanim:GetDescendants()) do
	if v:IsA("Part") or v:IsA("Decal") then v.Transparency = 1 end
end
Reanim.HumanoidRootPart.Anchored = false
game:GetService("RunService").Stepped:Connect(function()
	Character.Humanoid.Died:Connect(function()
		return
	end)
	for i,v in pairs(Character:GetDescendants()) do
		if v:IsA("BasePart") or v:IsA("MeshPart") then v.CanCollide = false end
	end
	Reanim.Humanoid:Move(Character.Humanoid.MoveDirection)
	if Character.Humanoid.RigType == Enum.HumanoidRigType.R6 and Character:FindFirstChild("GelatekReanim") then
		pcall(function() Character.Torso.CFrame = Reanim.Torso.CFrame end)
	end
end)

function AttachFunny(Part0,Part1,Position,Rotate)
	local Attachment0 = Instance.new("Attachment",Part0)
	local Attachment1 = Instance.new("Attachment",Part1)
	local AlignPosition = Instance.new("AlignPosition",Part0)
	local AlignOrientation = Instance.new("AlignOrientation",Part0)
	AlignPosition.Attachment0 = Attachment0;AlignPosition.Attachment1 = Attachment1
	AlignOrientation.Attachment0 = Attachment0; AlignOrientation.Attachment1 = Attachment1
	AlignPosition.RigidityEnabled = true
	AlignOrientation.MaxTorque = 6000000
	AlignOrientation.Responsiveness = 13e9
	Attachment0.Position = Position or Vector3.new(0,0,0)
	Attachment0.Orientation = Rotate or Vector3.new(0,0,0)
end

function Attach(Part1,Part2,Position,Rotate)
	for i,v in pairs(Part1:GetChildren()) do
		if v:IsA('Motor6D') and v.Name ~= "Neck" then 
			v:Destroy() 
		end
	end
	AttachFunny(Part1,Part2,Position,Rotate)
end

if game.Players.LocalPlayer.Character.Humanoid.RigType == Enum.HumanoidRigType.R15 then
	Reanim.HumanoidRootPart.CFrame = Character.UpperTorso.CFrame
	Attach(Character.UpperTorso, Reanim['Torso'], Vector3.new(0, -0.03, 0), Vector3.new(0, 0, 0))
	Attach(Character.LowerTorso, Reanim['Torso'], Vector3.new(0, 0.85, 0), Vector3.new(0, 0, 0))

	Attach(Character.RightHand, Reanim['Right Arm'], Vector3.new(0, 0.9, 0), Vector3.new(0, 0, 0))
	Attach(Character.LeftHand, Reanim['Left Arm'], Vector3.new(0, 0.9, 0), Vector3.new(0, 0, 0))
	Attach(Character.RightFoot, Reanim['Right Leg'], Vector3.new(0, 0.85, 0), Vector3.new(0, 0, 0))
	Attach(Character.LeftFoot, Reanim['Left Leg'], Vector3.new(0, 0.85, 0), Vector3.new(0, 0, 0))

	Attach(Character.RightUpperArm, Reanim['Right Arm'], Vector3.new(0, -0.242, 0), Vector3.new(0, 0, 0))
	Attach(Character.LeftUpperArm, Reanim['Left Arm'], Vector3.new(0, -0.242, 0), Vector3.new(0, 0, 0))
	Attach(Character.LeftUpperLeg, Reanim['Left Leg'], Vector3.new(0, -0.48, 0), Vector3.new(0, 0, 0))
	Attach(Character.RightUpperLeg, Reanim['Right Leg'], Vector3.new(0, -0.48, 0), Vector3.new(0, 0, 0))

	Attach(Character.RightLowerArm, Reanim['Right Arm'], Vector3.new(0, 0.35, 0), Vector3.new(0, 0, 0))
	Attach(Character.LeftLowerArm, Reanim['Left Arm'], Vector3.new(0, 0.35, 0), Vector3.new(0, 0, 0))
	Attach(Character.LeftLowerLeg, Reanim['Left Leg'], Vector3.new(0, 0.3, 0), Vector3.new(0, 0, 0))
	Attach(Character.RightLowerLeg, Reanim['Right Leg'], Vector3.new(0, 0.3, 0), Vector3.new(0, 0, 0))

	AttachFunny(Character.HumanoidRootPart, Reanim['HumanoidRootPart'])
	Character.HumanoidRootPart.Transparency = 0.5
else
	Reanim.HumanoidRootPart.CFrame = Character.Torso.CFrame
	Attach(Character["Right Arm"],Reanim["Right Arm"])
	Attach(Character["Left Arm"],Reanim["Left Arm"])
	Attach(Character["Right Leg"],Reanim["Right Leg"])
	Attach(Character["Left Leg"],Reanim["Left Leg"])
	Attach(Character["Torso"],Reanim["Torso"])
	Character.HumanoidRootPart:Destroy()
end
game:GetService("UserInputService").JumpRequest:Connect(function()
	Reanim.Humanoid.Jump = true
	Reanim.Humanoid.Sit = false
end)

if workspace:FindFirstChildOfClass("Camera") then workspace.Camera.CameraSubject = Reanim.Humanoid end
for _,Animations in pairs(game:GetService("Players").LocalPlayer.Character.Humanoid:GetPlayingAnimationTracks()) do
	Animations:Stop()
end
