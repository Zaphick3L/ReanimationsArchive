local Count = 1
function Align(Part0,Part1,Position,Angle)
	local AlignPosition = Instance.new('AlignPosition', Part1); AlignPosition.Name = "MiztWeldPos "..Count
	AlignPosition.ApplyAtCenterOfMass = true;
	AlignPosition.MaxForce = 600000;
	AlignPosition.MaxVelocity = math.huge/9e110;
	AlignPosition.ReactionForceEnabled = false;
	AlignPosition.Responsiveness = 200;
	AlignPosition.RigidityEnabled = false;

	local AlignOrientation = Instance.new('AlignOrientation', Part1); AlignOrientation.Name = "MiztWeldOri "..Count
	AlignOrientation.MaxAngularVelocity = math.huge/9e10;
	AlignOrientation.MaxTorque = 600000;
	AlignOrientation.PrimaryAxisOnly = false;
	AlignOrientation.ReactionTorqueEnabled = false;
	AlignOrientation.Responsiveness = 200;
	AlignOrientation.RigidityEnabled = false;

	local Attachment1 = Instance.new('Attachment',Part1); Attachment1.Name = "MiztAttachmentPos"..Count
	local Attachment2 = Instance.new('Attachment',Part0); Attachment2.Name = "MiztAttachmentPos"..Count
	local Attachment3 = Instance.new('Attachment',Part1); Attachment3.Name = "MiztAttachmentOri"..Count
	local Attachment4 = Instance.new('Attachment',Part0); Attachment4.Name = "MiztAttachmentOri"..Count

	Attachment3.Orientation = Angle
	Attachment1.Position = Position

	AlignPosition.Attachment1 = Attachment1;
	AlignPosition.Attachment0 = Attachment2;
	AlignOrientation.Attachment1 = Attachment3;
	AlignOrientation.Attachment0 = Attachment4;
	Count = Count + 1
end


local PPlayer = game:GetService("Players").LocalPlayer
local SwagCharacter = PPlayer.Character
game:GetService("RunService").RenderStepped:Connect(function()
    settings().Physics.PhysicsEnvironmentalThrottle = Enum.EnviromentalPhysicsThrottle.Disabled
    settings().Physics.AllowSleep = false
    PPlayer.ReplicationFocus = workspace
    sethiddenproperty(PPlayer, "SimulationRadius", 1000)
    sethiddenproperty(PPlayer, "MaxSimulationRadius", 1000)
end)

if _G.PDeath == false then
-- Creating Early Variables.
local Player = game.Players.LocalPlayer
local Character = Player.Character
local PlayerName = Player.Name
local Physics = settings().Physics
local Head = Character:FindFirstChild("Head")
local Torso = Character:FindFirstChild("Torso")
local HumanoidRootPart = Character:FindFirstChild("HumanoidRootPart")
local Humanoid = Character:FindFirstChild("Humanoid")
local LeftArm = Character:FindFirstChild("Left Arm")
local LeftLeg = Character:FindFirstChild("Left Leg")
local RightArm = Character:FindFirstChild("Right Arm")
local RightLeg = Character:FindFirstChild("Right Leg")
local Reanimated = true

if Humanoid.RigType == Enum.HumanoidRigType.R15 then
    game.StarterGui:SetCore("ChatMakeSystemMessage", {
        Text = "[Shiba Hub] You are on R15! Please use the R15 Reanimation instead.",
        Color = Color3.fromRGB(255, 10, 70),
        TextSize = 18,
        Font = Enum.Font.Ubuntu
    });
return end
if workspace:FindFirstChild("ShibaReanimate") then
    game.StarterGui:SetCore("ChatMakeSystemMessage", {
        Text = "[Shiba Hub] You are already reanimated! Please reset to unreanimate.",
        Color = Color3.fromRGB(255, 10, 70),
        TextSize = 18,
        Font = Enum.Font.Ubuntu
    });
return end

Character.Archivable = true
-- Checks if player died so it doesnt run again.
game:WaitForChild("Run Service").RenderStepped:Connect(function()
if Character:FindFirstChild("Humanoid").Health == 0 then
    Reanimated = false
    wait(9e9^30)
    end
end)
-- Start reanimation

game:WaitForChild("Run Service").Heartbeat:Connect(function()
    if Reanimated == true then
        if workspace:FindFirstChild("ShibaReanimate") then
            Character.Torso.CFrame = workspace.ShibaReanimate.Torso.CFrame
        end
		RightArm.Velocity = _G.Velocity
        RightLeg.Velocity =_G.Velocity
        LeftArm.Velocity = _G.Velocity
        LeftLeg.Velocity = _G.Velocity
                    if _G.R6Fling == true then
            Torso.Velocity = Vector3.new(9999,9999,9999)
            else
                Torso.Velocity = _G.Velocity
                end
        HumanoidRootPart.Velocity = _G.Velocity
        for _, Accessories in pairs(Character:GetDescendants()) do
            if Accessories:IsA("Accessory") then
                Accessories.Handle.Velocity = _G.Velocity
            end
	end
	
    end
end)

local CopyCharacter = Character:Clone()
CopyCharacter.Parent = workspace 
CopyCharacter.Name = "ShibaReanimate" -- you can always change name.

for k,parts in pairs(workspace.ShibaReanimate:GetDescendants()) do 
    if parts:IsA("Part") or parts:IsA("Decal") then
        parts.Transparency = 1
    end
end

Character.Torso["Left Shoulder"]:Destroy()
Character.Torso["Right Shoulder"]:Destroy()
Character.Torso["Left Hip"]:Destroy()
Character.Torso["Right Hip"]:Destroy()
HumanoidRootPart.RootJoint:Destroy()

Align(Torso,CopyCharacter["Torso"],Vector3.new(0,0,0),Vector3.new(0,0,0))
Align(HumanoidRootPart,CopyCharacter["HumanoidRootPart"],Vector3.new(0,0,0),Vector3.new(0,0,0))
Align(LeftArm,CopyCharacter["Left Arm"],Vector3.new(0,0,0),Vector3.new(0,0,0))
Align(RightArm,CopyCharacter["Right Arm"],Vector3.new(0,0,0),Vector3.new(0,0,0))
Align(LeftLeg,CopyCharacter["Left Leg"],Vector3.new(0,0,0),Vector3.new(0,0,0))
Align(RightLeg,CopyCharacter["Right Leg"],Vector3.new(0,0,0),Vector3.new(0,0,0))
CopyCharacter:FindFirstChild("HumanoidRootPart").Anchored = false
spawn(function() 
    while true do wait()
        if Character:FindFirstChild("Humanoid").Health == 0 then 
                Character:BreakJoints()
                CopyCharacter:Destroy()
                CopyCharacter:BreakJoints()
        end
    end 
end)


function NoCollisionConstraint(t)
    for k,l in pairs(Character:GetDescendants()) do 
        if l:IsA("BasePart")then 
            HILOL=Instance.new("NoCollisionConstraint",l)
            HILOL.Part0=l
            HILOL.Part1=t 
        end 
    end 
end

for k,l in pairs(CopyCharacter:GetDescendants()) do
     if l:IsA("BasePart")then 
        NoCollisionConstraint(l)
    end 
end

Torso.Anchored = true
LeftArm.Anchored = true
RightArm.Anchored = true
LeftLeg.Anchored = true
RightLeg.Anchored = true
Head.Anchored = true
local cchumanoid = game.workspace:WaitForChild("ShibaReanimate").Humanoid
local ccroot = game.workspace:WaitForChild("ShibaReanimate").HumanoidRootPart
for k=0,30 do wait()
   ccroot.RotVelocity = Vector3.new(0,0,0)
   ccroot.Velocity = Vector3.new(0,0,0)
end

Character.Animate.Disabled = true

game:GetService("UserInputService").JumpRequest:connect(function(t)
    if cchumanoid.FloorMaterial~=Enum.Material.Air then 
        cchumanoid:ChangeState(Enum.HumanoidStateType.Jumping)
        workspace.ShibaReanimate:FindFirstChildOfClass('Humanoid').Sit=false 
    end 
end)


game.RunService.RenderStepped:Connect(function()
    cchumanoid:Move(Character.Humanoid.MoveDirection,false)
    local animtracks = Humanoid:GetPlayingAnimationTracks()
        for n,l in pairs(animtracks) do 
            l:Stop()
        end 
end)

Torso.Anchored = false
LeftArm.Anchored = false
RightArm.Anchored = false
LeftLeg.Anchored = false
RightLeg.Anchored = false
Head.Anchored = false

local something = true
while true do 
    if something == true then 
        for n,l in pairs(Character:children()) do 
            pcall(function()
                if l.className=="Part" then 
                    l.CanCollide=false 
                elseif 
                    l.ClassName=="Model" then 
                        l.Head.CanCollide=false 
                end
            end)
        end
    end
game:service("RunService").Stepped:wait()
end
elseif _G.PDeath == true then

    local Count = 1
function PDeathAlign(Part0,Part1,Position,Angle)
    game['Run Service'].Heartbeat:Connect(function()
        Part0.Velocity = _G.Velocity
    end)
	local AlignPosition = Instance.new('AlignPosition', Part1); AlignPosition.Name = "MiztWeldPos "..Count
	AlignPosition.ApplyAtCenterOfMass = true;
	AlignPosition.MaxForce = 600000;
	AlignPosition.MaxVelocity = math.huge/9e110;
	AlignPosition.ReactionForceEnabled = false;
	AlignPosition.Responsiveness = 200;
	AlignPosition.RigidityEnabled = false;

	local AlignOrientation = Instance.new('AlignOrientation', Part1); AlignOrientation.Name = "MiztWeldOri "..Count
	AlignOrientation.MaxAngularVelocity = math.huge/9e10;
	AlignOrientation.MaxTorque = 600000;
	AlignOrientation.PrimaryAxisOnly = false;
	AlignOrientation.ReactionTorqueEnabled = false;
	AlignOrientation.Responsiveness = 200;
	AlignOrientation.RigidityEnabled = false;

	local Attachment1 = Instance.new('Attachment',Part1); Attachment1.Name = "MiztAttachmentPos"..Count
	local Attachment2 = Instance.new('Attachment',Part0); Attachment2.Name = "MiztAttachmentPos"..Count
	local Attachment3 = Instance.new('Attachment',Part1); Attachment3.Name = "MiztAttachmentOri"..Count
	local Attachment4 = Instance.new('Attachment',Part0); Attachment4.Name = "MiztAttachmentOri"..Count

	Attachment3.Orientation = Angle
	Attachment1.Position = Position

	AlignPosition.Attachment1 = Attachment1;
	AlignPosition.Attachment0 = Attachment2;
	AlignOrientation.Attachment1 = Attachment3;
	AlignOrientation.Attachment0 = Attachment4;
	Count = Count + 1
end
HumanDied = false
	game:GetService("Players").LocalPlayer["Character"].Archivable = true 
	local CloneChar = game:GetService("Players").LocalPlayer["Character"]:Clone()
	game:GetService("Players").LocalPlayer["Character"].Humanoid.WalkSpeed = 0 
	game:GetService("Players").LocalPlayer["Character"].Humanoid.JumpPower = 0 
	game:GetService("Players").LocalPlayer["Character"].Humanoid.AutoRotate = false
	local FalseChar = Instance.new("Model", workspace); FalseChar.Name = ""
	Instance.new("Part",FalseChar).Name = "Head" 
	Instance.new("Part",FalseChar).Name = "Torso" 
	Instance.new("Humanoid",FalseChar).Name = "Humanoid"
	game:GetService("Players").LocalPlayer["Character"] = FalseChar
	game:GetService("Players").LocalPlayer["Character"].Humanoid.Name = "FalseHumanoid"
	local Clone = game:GetService("Players").LocalPlayer["Character"]:FindFirstChild("FalseHumanoid"):Clone()
	Clone.Parent = game:GetService("Players").LocalPlayer["Character"]
	Clone.Name = "Humanoid"
	game:GetService("Players").LocalPlayer["Character"]:FindFirstChild("FalseHumanoid"):Destroy() 
	game:GetService("Players").LocalPlayer["Character"].Humanoid.Health = 0 
	game:GetService("Players").LocalPlayer["Character"] = workspace[game:GetService("Players").LocalPlayer.Name] 
	wait(5.65) 
	game:GetService("Players").LocalPlayer["Character"].Humanoid.Health = 0
	CloneChar.Parent = workspace 
	CloneChar.HumanoidRootPart.CFrame = game:GetService("Players").LocalPlayer["Character"].HumanoidRootPart.CFrame * CFrame.new(0,2,0)
	wait() 
	CloneChar.Humanoid.BreakJointsOnDeath = false
	workspace.Camera.CameraSubject = CloneChar.Humanoid 
	CloneChar.Name = "ShibaReanimate" 
	CloneChar.Humanoid.DisplayDistanceType = "None"
	if CloneChar.Head:FindFirstChild("face") then CloneChar.Head:FindFirstChild("face"):Destroy() end
	if workspace[game:GetService("Players").LocalPlayer.Name].Head:FindFirstChild("face") then workspace[game:GetService("Players").LocalPlayer.Name].Head:FindFirstChild("face").Parent = CloneChar.Head end
	FalseChar:Destroy()


    
	local DeadChar = workspace[game:GetService("Players").LocalPlayer.Name]
    _G.ActualPDeath = true
	local LVecPart = Instance.new("Part", workspace) LVecPart.CanCollide = false LVecPart.Transparency = 1
	local CONVEC
	local function VECTORUNIT()
	if HumanDied then CONVEC:Disconnect(); return end
	local lookVec = workspace.Camera.CFrame.lookVector
	local Root = CloneChar["HumanoidRootPart"]
	LVecPart.Position = Root.Position
	LVecPart.CFrame = CFrame.new(LVecPart.Position, Vector3.new(lookVec.X * 9999, lookVec.Y, lookVec.Z * 9999))
	end
	CONVEC = game:GetService("RunService").Heartbeat:Connect(VECTORUNIT)

	local CONDOWN
	local WDown, ADown, SDown, DDown, SpaceDown = false, false, false, false, false
	local function KEYDOWN(_,Processed) 
	if HumanDied then CONDOWN:Disconnect(); return end
	if Processed ~= true then
	local Key = _.KeyCode
	if Key == Enum.KeyCode.W then
	WDown = true end
	if Key == Enum.KeyCode.A then
	ADown = true end
	if Key == Enum.KeyCode.S then
	SDown = true end
	if Key == Enum.KeyCode.D then
	DDown = true end
	if Key == Enum.KeyCode.Space then
	SpaceDown = true end end end
	CONDOWN = game:GetService("UserInputService").InputBegan:Connect(KEYDOWN)

	local CONUP
	local function KEYUP(_)
	if HumanDied then CONUP:Disconnect(); return end
	local Key = _.KeyCode
	if Key == Enum.KeyCode.W then
	WDown = false end
	if Key == Enum.KeyCode.A then
	ADown = false end
	if Key == Enum.KeyCode.S then
	SDown = false end
	if Key == Enum.KeyCode.D then
	DDown = false end
	if Key == Enum.KeyCode.Space then
	SpaceDown = false end end
	CONUP = game:GetService("UserInputService").InputEnded:Connect(KEYUP)

	local function MoveClone(X,Y,Z)
	LVecPart.CFrame = LVecPart.CFrame * CFrame.new(-X,Y,-Z)
	workspace["ShibaReanimate"].Humanoid.WalkToPoint = LVecPart.Position
	end

	coroutine.wrap(function() 
	while true do game:GetService("RunService").RenderStepped:Wait()
	if HumanDied then break end
	if WDown then MoveClone(0,0,1e4) end
	if ADown then MoveClone(1e4,0,0) end
	if SDown then MoveClone(0,0,-1e4) end
	if DDown then MoveClone(-1e4,0,0) end
	if SpaceDown then CloneChar["Humanoid"].Jump = true end
	if WDown ~= true and ADown ~= true and SDown ~= true and DDown ~= true then
	workspace["ShibaReanimate"].Humanoid.WalkToPoint = workspace["ShibaReanimate"].HumanoidRootPart.Position end
	end 
	end)()

	local con
	function UnCollide()
		if HumanDied then con:Disconnect(); return end
		for _,Parts in next, CloneChar:GetDescendants() do
			if Parts:IsA("BasePart") then
				Parts.CanCollide = false 
			end 
		end
		for _,Parts in next, DeadChar:GetDescendants() do
			if Parts:IsA("BasePart") then
			Parts.CanCollide = false
			end 
		end 
	end
	con = game:GetService("RunService").Stepped:Connect(UnCollide)

	local resetBindable = Instance.new("BindableEvent")
	resetBindable.Event:connect(function()
		game:GetService("StarterGui"):SetCore("ResetButtonCallback", true)
		resetBindable:Destroy()
		CloneChar.Humanoid.Health = 0
	end)
	game:GetService("StarterGui"):SetCore("ResetButtonCallback", resetBindable)

	coroutine.wrap(function()
		while true do
			game:GetService("RunService").RenderStepped:wait()
			if not CloneChar or not CloneChar:FindFirstChild("Head") or not CloneChar:FindFirstChild("Humanoid") or CloneChar:FindFirstChild("Humanoid").Health <= 0 then 
				HumanDied = true
				pcall(function()
					game.Players.LocalPlayer.Character = CloneChar
					CloneChar:Destroy()
					game.Players.LocalPlayer.Character = DeadChar
					if resetBindable then
						game:GetService("StarterGui"):SetCore("ResetButtonCallback", true)
						resetBindable:Destroy()
					end
					DeadChar.Humanoid.Health = 0
                    _G.ActualPDeath = false
                    LVecPart:Destroy()
				end)
				break
			end		
		end
	end)()


    
	PDeathAlign(DeadChar["Head"],CloneChar["Head"],Vector3.new(0,0,0),Vector3.new(0,0,0))
	PDeathAlign(DeadChar["Torso"],CloneChar["Torso"],Vector3.new(0,0,0),Vector3.new(0,0,0))
	PDeathAlign(DeadChar["Left Arm"],CloneChar["Left Arm"],Vector3.new(0,0,0),Vector3.new(0,0,0))
	PDeathAlign(DeadChar["Right Arm"],CloneChar["Right Arm"],Vector3.new(0,0,0),Vector3.new(0,0,0))
	PDeathAlign(DeadChar["Left Leg"],CloneChar["Left Leg"],Vector3.new(0,0,0),Vector3.new(0,0,0))
	PDeathAlign(DeadChar["Right Leg"],CloneChar["Right Leg"],Vector3.new(0,0,0),Vector3.new(0,0,0))
    PDeathAlign(DeadChar["HumanoidRootPart"],CloneChar["HumanoidRootPart"],Vector3.new(0,0,0),Vector3.new(0,0,0))

	for _,v in next, DeadChar:GetChildren() do
		if v:IsA("Accessory") then
			PDeathAlign(v.Handle,CloneChar[v.Name].Handle,Vector3.new(0,0,0),Vector3.new(0,0,0))
		end
	end

	for _,BodyParts in next, CloneChar:GetDescendants() do
	if BodyParts:IsA("BasePart") or BodyParts:IsA("Part") then
	BodyParts.Transparency = 1 end end
end
