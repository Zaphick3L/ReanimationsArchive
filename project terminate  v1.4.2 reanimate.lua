_G.Settings = {
	Bullet = false,
	Fling = false,
	CFrameMethod = false,
}

	if game.Players.LocalPlayer.Character:FindFirstChild("Rig") then
	game.StarterGui:SetCore("SendNotification",{
		Title = "Gelatek Reanimate",
		Text = "Already Reanimated! Reset to procced.",
	})
	return
	end

	function Align(Part0,Part1,Position,Orientation)
		local AlignPosition = Instance.new("AlignPosition",Part0)
		local AlignOrientation = Instance.new("AlignOrientation",Part0)
		local Attachment1 = Instance.new("Attachment",Part0)
		local Attachment2 = Instance.new("Attachment",Part1)
		AlignPosition.MaxForce,AlignOrientation.MaxTorque = 9e9,9e9 -- MaxTorque
		AlignPosition.Responsiveness,AlignOrientation.Responsiveness = 200,200 -- Responsiveness
		AlignPosition.Attachment0,AlignPosition.Attachment1 = Attachment1,Attachment2 -- AlignPos Config
		AlignOrientation.Attachment0,AlignOrientation.Attachment1 = Attachment1,Attachment2 -- AlignOri Config
		Attachment1.Position = Position or Vector3.new(0,0,0) -- Position
		Attachment1.Orientation = Orientation or Vector3.new(0,0,0) -- Orientation
	end

	function AlignR15(Part0,Part1,Position,Orientation)
		for _,v in pairs(Part0:GetChildren()) do
			if v:IsA("Motor6D") and v.Name ~= "Neck" then
				v:Destroy()
			end
		end
		Align(Part0,Part1,Position,Orientation)
	end

	-- Beginning
	local UIS = game:GetService("UserInputService")
	local RunService = game:GetService("RunService")
	local Player = game:GetService("Players").LocalPlayer
	local Character = Player.Character
	local Humanoid = Character:FindFirstChild("Humanoid")
	local Torso = Character:FindFirstChild("Torso") or Character:FindFirstChild("UpperTorso")
	local Root = Character:FindFirstChild("HumanoidRootPart")
	local Dead = false
	local Noclip;
	local Netless;
	local Test;
	-- Startup
	Character.Archivable = true
	local Reanimate = game:GetObjects('rbxassetid://8440552086')[1]
	Reanimate.Parent = Character
	Reanimate.Name = "Rig" -- name by DankPog
	local CloneHumanoid = Reanimate:FindFirstChild("Humanoid")
	local CloneTorso = Reanimate:FindFirstChild("Torso")
	for _, v in pairs(Reanimate:GetDescendants()) do
		if v:IsA("BasePart") or v:IsA("Decal") then
			v.Transparency = 1
		end
	end
	pcall(function()
		for i, v in pairs(Humanoid:GetChildren()) do
			if v:IsA("NumberValue") then v:Destroy() end
		end
	end)
	function NoclipF()
		for _, v in pairs(Character:GetDescendants()) do
			if v:IsA("BasePart") or v:IsA("MeshPart") then
				v.CanCollide = false
			end
		end
		CloneHumanoid:Move(Humanoid.MoveDirection)
				for _,v in pairs(Humanoid:GetPlayingAnimationTracks()) do
			v:Stop()
		end
	end
	
	Noclip = RunService.Stepped:Connect(NoclipF)
	function NetlessF()
		for _, v in pairs(Character:GetChildren()) do
			if v:IsA("BasePart") or v:IsA("MeshPart") and v.Name ~= "UpperTorso" and v.Name ~= "Torso" then
				v.Velocity = _G.Velocity or Vector3.new(35,0,0)
			elseif v:IsA("Accessory") then
				v.Handle.Velocity = _G.Velocity or Vector3.new(35,0,0)
			end
		end
		if Humanoid.RigType == Enum.HumanoidRigType.R15 then
			Root.CFrame = CloneTorso.CFrame
		end
		if _G.Settings.Fling == true then
			Torso.Velocity = Vector3.new(3000,3000,3000)
		else
			Torso.Velocity = _G.Velocity or Vector3.new(35,0,0)
		end
		if Humanoid.RigType == Enum.HumanoidRigType.R15 then
				Torso.CFrame = CloneTorso.CFrame + Vector3.new(0,0.19,0)
			else
				Torso.CFrame = CloneTorso.CFrame
		end
		if not syn then
			settings().Physics.PhysicsEnvironmentalThrottle = Enum.EnviromentalPhysicsThrottle.Disabled
			settings().Physics.AllowSleep = false
			game.Players.LocalPlayer.MaximumSimulationRadius = 1000
			setsimulationradius(1000,1000)
		end
	end
	Netless = RunService.Heartbeat:Connect(NetlessF)

	UIS.JumpRequest:Connect(function()
		pcall(function()
			CloneHumanoid.Jump = true
			CloneHumanoid.Sit = false
		end)
	end)


	if Humanoid.RigType == Enum.HumanoidRigType.R6 then
	Reanimate.HumanoidRootPart.CFrame = Torso.CFrame
	Character.Torso["Left Shoulder"]:Destroy()
	Character.Torso["Right Shoulder"]:Destroy()
	Character.Torso["Left Hip"]:Destroy()
	Character.Torso["Right Hip"]:Destroy()
	Character.HumanoidRootPart:Destroy()
	if _G.Settings.CFrameMethod == false then
	Align(Character.Torso,Reanimate.Torso)
	Align(Character['Right Arm'],Reanimate['Right Arm'])
	Align(Character['Left Arm'],Reanimate['Left Arm'])
	Align(Character['Right Leg'],Reanimate['Right Leg'])
	Align(Character['Left Leg'],Reanimate['Left Leg'])
	elseif _G.Settings.CFrameMethod == true then
	local A,A1 = Character:FindFirstChild("Right Arm"),Reanimate:FindFirstChild("Right Arm")
	local B,B1 = Character:FindFirstChild("Left Arm"),Reanimate:FindFirstChild("Left Arm")
	local C,C1 = Character:FindFirstChild("Right Leg"),Reanimate:FindFirstChild("Right Leg")
	local D,D1 = Character:FindFirstChild("Left Leg"),Reanimate:FindFirstChild("Left Leg")
	function CFM()--RunService.RenderStepped:Connect(function()
		B.CFrame = B1.CFrame
		C.CFrame = C1.CFrame
		D.CFrame = D1.CFrame
		if _G.Settings.Bullet == false then
			A.CFrame = A1.CFrame
		end
	end
		if _G.Settings.Bullet == true then
			Align(Character['Right Arm'],Reanimate['Right Arm'])
		end
		Test = RunService.RenderStepped:Connect(CFM)
	end

	if _G.Settings.Bullet == true then
		Humanoid:ChangeState("Physics")
		local Hat = Character:FindFirstChild("Pal Hair").Handle
		Hat.AccessoryWeld:Destroy()
		Hat.Mesh:Destroy()
		Align(Hat,Reanimate["Right Arm"],Vector3.new(0,0,0),Vector3.new(90,0,0))
		Character["Right Arm"].Name = "Bullet"
	end
	Reanimate.Animate:Destroy()
	local Animate = Character.Animate:Clone()
	Animate.Parent = Reanimate
	Character.Animate.Disabled = true
	elseif Humanoid.RigType == Enum.HumanoidRigType.R15 then
		Character.Animate.Disabled = true
	Reanimate.HumanoidRootPart.CFrame = Torso.CFrame
	AlignR15(Character.UpperTorso, Reanimate['Torso'],Vector3.new(0, -0.19, 0))
	AlignR15(Character.LowerTorso, Reanimate['Torso'],Vector3.new(0, 0.75, 0))



	AlignR15(Character.LeftUpperArm, Reanimate['Left Arm'],Vector3.new(0, -0.405, 0)) 
	AlignR15(Character.LeftLowerArm, Reanimate['Left Arm'],Vector3.new(0, 0.18, 0))
	AlignR15(Character.LeftHand, Reanimate['Left Arm'],Vector3.new(0, 0.8, 0))

	AlignR15(Character.RightUpperArm, Reanimate['Right Arm'],Vector3.new(0, -0.405, 0))
	AlignR15(Character.RightLowerArm, Reanimate['Right Arm'],Vector3.new(0, 0.18, 0))
	AlignR15(Character.RightHand, Reanimate['Right Arm'],Vector3.new(0, 0.8, 0))

	AlignR15(Character.LeftUpperLeg, Reanimate['Left Leg'],Vector3.new(0, -0.6, 0))
	AlignR15(Character.LeftLowerLeg, Reanimate['Left Leg'],Vector3.new(0, 0.15, 0))
	AlignR15(Character.LeftFoot, Reanimate['Left Leg'],Vector3.new(0, 0.85, 0))


	AlignR15(Character.RightUpperLeg, Reanimate['Right Leg'],Vector3.new(0, -0.6, 0))
	AlignR15(Character.RightLowerLeg, Reanimate['Right Leg'],Vector3.new(0, 0.15, 0))
	AlignR15(Character.RightFoot, Reanimate['Right Leg'],Vector3.new(0, 0.85, 0))

	AlignR15(Character.HumanoidRootPart, Reanimate['HumanoidRootPart'])
	if _G.Settings.Bullet == true then
		Character.LowerTorso.Name = "Bullet"
		Humanoid:ChangeState("Physics")
		end
	end
	Humanoid.Died:Connect(function()
	Dead = true
	pcall(function()
	Noclip:Disconnect()
	Netless:Disconnect()
	Test:Disconnect()
	Reanimate:BreakJoints()
	end)
	workspace.Camera.CameraSubject = Humanoid
	end)
	
	workspace.Camera.CameraSubject = CloneHumanoid
	game.StarterGui:SetCore("SendNotification",{
		Title = "Gelatek Reanimate",
		Text = "Reanimated.",
	})
