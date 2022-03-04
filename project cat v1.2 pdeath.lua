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
	AlignOrientation.ReactionTorqueEnabled = false
	Attachment1.Position = Position or Vector3.new(0,0,0)
	Attachment1.Orientation = Rotate or Vector3.new(0,0,0)
	game:GetService("RunService").Heartbeat:Connect(function() 
		Part0.Velocity = Vector3.new(30,0,0)
	end)
end

if game.Players.LocalPlayer.Character:findFirstChild("Reanimate") then
		Message("Project: Cat -  You are already reanimated!")
		return
	end
	if game.Players.LocalPlayer.Character.Humanoid.RigType == Enum.HumanoidRigType.R6 then
		local Player = game.Players.LocalPlayer
		Player.Character.Archivable = true 
		local CloneChar = Player.Character:Clone()
		CloneChar.Parent = Player.Character
		CloneChar.Name = "Reanimate"
		Player.Character.Humanoid.BreakJointsOnDeath = false
		Player.Character.Humanoid.WalkSpeed = 0
		Player.Character.Humanoid.JumpPower = 0
		for i, v in pairs(CloneChar:GetDescendants()) do if v:IsA("BasePart") or v:IsA("Decal") then v.Transparency = 1 end end
		local Dead = Instance.new("Model", workspace)
		local DHead = Instance.new("Part", Dead); DHead.Name = "Head"
		local DTorso = Instance.new("Part", Dead); DTorso.Name = "Torso"
		local DHumanoid = Instance.new("Humanoid", Dead)
		Player.Character = Dead
		game:GetService("Players").LocalPlayer.Character.Humanoid.Name = "Unown"
		local NewHumanoid = game:GetService("Players").LocalPlayer.Character.Unown:Clone()
		NewHumanoid.Name = "Humanoid"
		NewHumanoid.Parent = game:GetService("Players").LocalPlayer.Character
		game:GetService("Players").LocalPlayer.Character.Unown:Destroy()
		NewHumanoid.Health = 0
		Player.Character = workspace[game:GetService("Players").LocalPlayer.Name]
		wait(5.65)
		local Humanoid = CloneChar:FindFirstChild("Humanoid")
		Humanoid.BreakJointsOnDeath = false
		game:GetService("Players").LocalPlayer.Character.Humanoid.Health = 0
		Dead:Destroy()

		for i, v in pairs(CloneChar:GetDescendants()) do if v:IsA("BasePart") or v:IsA("Decal") then v.Transparency = 1 end end
		local Character = Player.Character
		Character.Torso["Left Shoulder"]:Destroy();Character.Torso["Right Shoulder"]:Destroy();Character.Torso["Left Hip"]:Destroy();Character.Torso["Right Hip"]:Destroy()
		Character.HumanoidRootPart["RootJoint"]:Destroy()
		AlignObject(Character.Torso,CloneChar.Torso)
		AlignObject(Character.Head,CloneChar.Head)
		AlignObject(Character["Right Arm"],CloneChar["Right Arm"])
		AlignObject(Character["Left Arm"],CloneChar["Left Arm"])
		AlignObject(Character["Right Leg"],CloneChar["Right Leg"])
		AlignObject(Character["Left Leg"],CloneChar["Left Leg"])
		AlignObject(Character["HumanoidRootPart"],CloneChar["HumanoidRootPart"])
		_G.Reanimated = true;_G.PermamentDeath = true
		
		local Collision
		function NoCollisions()
			for i, v in pairs(Character:GetDescendants()) do
				if v:IsA("BasePart") then
					v.CanCollide = false
				end 
			end
		end
		Collision = game:GetService("RunService").Stepped:Connect(NoCollisions)
		
		for i, v in pairs(Character:GetChildren()) do
			if v:IsA("Accessory") then
				v.Handle.AccessoryWeld:Remove()
				AlignObject(v.Handle, CloneChar[v.Name].Handle)
			end
		end
		
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
				for i, Anims in pairs(AnimationTracks) do
					Anims:Stop()
				end
			end
		)
		local ResetBind = Instance.new("BindableEvent") -- comment 3/4/2022: skidded from mizt btw lol
		ResetBind.Event:connect(
			function()
				game:GetService("StarterGui"):SetCore("ResetButtonCallback", true)
				Player.Character = CloneChar
				CloneChar:Destroy()
				Player.Character = Character
				Collision:Disconnect()
				_G.Reanimated = false;_G.PermamentDeath = false
			end
		)
		game:GetService("StarterGui"):SetCore("ResetButtonCallback", ResetBind)
		Message("Project: Cat - Reanimated")
	else
		Message("Project: Cat -  R15 PDeath Has been Disabled Probably Forever. (Broken)")
	end
