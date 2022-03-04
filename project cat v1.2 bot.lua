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
	
	AlignObject(Torso1.Handle, CharacterClone["Torso"], Vector3.new(0.5, 0, 0), Vector3.new(90, 0, 0))
	AlignObject(Torso2.Handle, CharacterClone["Torso"], Vector3.new(-0.5, 0, 0), Vector3.new(90, 0, 0))
	AlignObject(LeftArm.Handle, CharacterClone["Left Arm"], Vector3.new(0, 0, 0), Vector3.new(90, 0, 0))
	AlignObject(RightArm.Handle, CharacterClone["Right Arm"], Vector3.new(0, 0, 0), Vector3.new(90, 0, 0))
	AlignObject(LeftLeg.Handle, CharacterClone["Left Leg"], Vector3.new(0, 0, 0), Vector3.new(90, 0, 0))
	AlignObject(RightLeg.Handle, CharacterClone["Right Leg"], Vector3.new(0, 0, 0), Vector3.new(90, 0, 0))
	AlignObject(Head.Handle, CharacterClone["Head"], Vector3.new(0, 0, -0.2), Vector3.new(0, 0, 0))
	for i ,v in pairs(Character:GetChildren()) do
		if v:IsA("Accessory") and v.Name ~= "Pal Hair" and v.Name ~= "Kate Hair" and v.Name ~= "LavanderHair" and v.Name ~= "Pink Hair" and v.Name ~= "Hat1" and v.Name ~= "Robloxclassicred" and v.Name ~= "MediHood" then
			v.Handle:BreakJoints()
			AlignObject(v.Handle,CharacterClone[v.Name].Handle)
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
	_G.BotReanimated = false
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
	
	Character.Humanoid.WalkSpeed = 0
	Character.Humanoid.JumpPower = 0
	
