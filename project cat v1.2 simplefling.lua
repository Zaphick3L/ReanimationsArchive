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
	local Character = workspace[game.Players.LocalPlayer.Name]
	local OGTorso = Character:FindFirstChild("Torso")
	Character.Archivable = true
	local CharacterClone = Character:Clone()
	CharacterClone.Humanoid.DisplayDistanceType = "None"
	CharacterClone.Parent = Character
	CharacterClone.Name = "Reanimate"
	for i, v in pairs(CharacterClone:GetDescendants()) do if v:IsA("BasePart") or v:IsA("Decal") then v.Transparency = 1 end end
	_G.Reanimated = true
	workspace.Camera.CameraSubject = CharacterClone.Humanoid
	Character.Torso["Left Shoulder"]:Destroy();Character.Torso["Right Shoulder"]:Destroy();Character.Torso["Left Hip"]:Destroy();Character.Torso["Right Hip"]:Destroy()
	AlignObject1(Character.Torso,CharacterClone.Torso)
	--AlignObject1(Character.Head,CharacterClone.Head)
	AlignObject1(Character["Right Arm"],CharacterClone["Right Arm"])
	AlignObject1(Character["Left Arm"],CharacterClone["Left Arm"])
	AlignObject1(Character["Right Leg"],CharacterClone["Right Leg"])
	AlignObject1(Character["Left Leg"],CharacterClone["Left Leg"])
	for i ,v in pairs(Character:GetChildren()) do
	if v:IsA("Accessory") then
		AlignObject1(v.Handle,CharacterClone[v.Name].Handle)
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
	_G.Reanimated = false
	wait(5.65)
	Collision:Disconnect() 
	return end)
	for i, v in pairs(Character:GetChildren()) do
		if v:IsA("BasePart") then
			v.CanCollide = false
		end 
	end
	end
	Collision = game:GetService("RunService").Stepped:Connect(NoCollisions)
	Character.HumanoidRootPart:Destroy()
	game:GetService("RunService").Heartbeat:Connect(function()
	if _G.Fling == true then
	OGTorso.Velocity = Vector3.new(-0.9,5000,5000)
	OGTorso.CFrame = CharacterClone:FindFirstChild("Torso").CFrame
	end
	end)
			Message("Project Cat: Reanimated.")
	else
		Character = game.Players.LocalPlayer.Character
		Character.Archivable = true
		local ReanimateCharacter = game:GetObjects("rbxassetid://8025310296")[1]
		ReanimateCharacter.Parent = Character
		ReanimateCharacter.Name = "Reanimate"
		_G.Reanimated = true
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
		local Collider
		function Noclip()
			Character.Humanoid.Died:Connect(function()
				_G.Reanimated = false
				ReanimateCharacter.Humanoid.WalkSpeed = 0
				ReanimateCharacter.Humanoid.JumpPower = 0
				ReanimateCharacter:BreakJoints()
				wait(5.65)
				Collider:Disconnect()
				return
			end)
			
			for i, v in pairs(ReanimateCharacter:GetDescendants()) do
				if v:IsA("BasePart") then
					v.CanCollide = false
				end
			end
			
			for i, v in pairs(Character:GetDescendants()) do
				if v:IsA("BasePart") then
					v.CanCollide = false
				end
			end
		end
		
		Collider = game:GetService("RunService").Stepped:Connect(Noclip) 
		
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
		AlignObject(Character["Head"],ReanimateCharacter["Head"],Position,Rotate)
		for i ,v in pairs(Character:GetChildren()) do
			if v:IsA("Accessory") then
				v.Handle:BreakJoints()
				AlignObject(v.Handle,ReanimateCharacter[v.Name].Handle)
			end
		end
		local Humanoid = ReanimateCharacter:FindFirstChild("Humanoid")
		workspace.Camera.CameraSubject = Humanoid
			game:GetService("UserInputService").JumpRequest:connect(function()
				if Character:FindFirstChild("Reanimate") then
				if Humanoid.FloorMaterial ~= Enum.Material.Air then 
					Humanoid:ChangeState(Enum.HumanoidStateType.Jumping) Humanoid.Sit = false 
				end 
			end
			end)
			game:GetService('RunService').RenderStepped:Connect(function()
				if Character:FindFirstChild("Reanimate") then
				Humanoid:Move(Character.Humanoid.MoveDirection, false)
				local AnimationTracks = Character.Humanoid:GetPlayingAnimationTracks()
					for n,Anims in pairs(AnimationTracks) do 
						Anims:Stop()
				end 
			end
		end)
		
		if _G.Fling == true then
		local hrp = Character.HumanoidRootPart
		local tors = ReanimateCharacter.Torso
		hrp.Transparency = 1
		   local Highlight = Instance.new("SelectionBox")
			Highlight.Adornee = hrp
			Highlight.Color3 = Color3.fromRGB(138,43,226)
			Highlight.Parent = hrp
			Highlight.Name = "HighlightBox"
			Highlight.LineThickness = 0.01
		if hrp:FindFirstChildOfClass("AlignPosition") then
		hrp:FindFirstChildOfClass("AlignPosition"):Destroy()
		end
		if hrp:FindFirstChildOfClass("AlignOrientation") then
		hrp:FindFirstChildOfClass("AlignOrientation"):Destroy()
		end
		flinger = Instance.new("BodyAngularVelocity",hrp)
		flinger.MaxTorque = Vector3.new(math.huge,math.huge,math.huge)
		flinger.P = 1000000000000000000000000000
		flinger.AngularVelocity = Vector3.new(0,0,0)
		local bodypos = Instance.new("BodyPosition",hrp)
		bodypos.D = 1250
		bodypos.P = 125
		spawn(function()
			while wait() do
				bodypos.Position = tors.Position
			end
		end)
		
		wait(3)
		flinger.AngularVelocity = Vector3.new(1500,1500,1500)
		end
