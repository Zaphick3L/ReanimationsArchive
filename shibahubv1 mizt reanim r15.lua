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

if Humanoid.RigType == Enum.HumanoidRigType.R6 then
    game.StarterGui:SetCore("ChatMakeSystemMessage", {
        Text = "[Shiba Hub] You are on R6! Please use the R6 Reanimation instead.",
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
HumanDied = false
    local plr = game.Players.LocalPlayer
    local physicSettings = settings().Physics
        physicSettings.PhysicsEnvironmentalThrottle = Enum.EnviromentalPhysicsThrottle.Disabled
        physicSettings.AllowSleep = false
        plr.ReplicationFocus = workspace
        sethiddenproperty(plr,"SimulationRadius",1000)
        sethiddenproperty(plr,"MaxSimulationRadius",1000)
    
    local CountSCIFIMOVIELOL = 1
    function SCIFIMOVIELOL(Part0,Part1,Position,Angle)
            game['Run Service'].Heartbeat:Connect(function()
            Part0.Velocity = _G.Velocity
        end)
        local AlignPos = Instance.new('AlignPosition', Part1); AlignPos.Name = "AliP_"..CountSCIFIMOVIELOL
        AlignPos.ApplyAtCenterOfMass = true;
        AlignPos.MaxForce = 600000;
        AlignPos.MaxVelocity = math.huge/9e110;
        AlignPos.ReactionForceEnabled = false;
        AlignPos.Responsiveness = 200;
        AlignPos.RigidityEnabled = false;
        local AlignOri = Instance.new('AlignOrientation', Part1); AlignOri.Name = "AliO_"..CountSCIFIMOVIELOL
        AlignOri.MaxAngularVelocity = math.huge/9e110;
        AlignOri.MaxTorque = 600000;
        AlignOri.PrimaryAxisOnly = false;
        AlignOri.ReactionTorqueEnabled = false;
        AlignOri.Responsiveness = 200;
        AlignOri.RigidityEnabled = false;
        local AttachmentA=Instance.new('Attachment',Part1); AttachmentA.Name = "AthP_"..CountSCIFIMOVIELOL
        local AttachmentB=Instance.new('Attachment',Part0); AttachmentB.Name = "AthP_"..CountSCIFIMOVIELOL
        local AttachmentC=Instance.new('Attachment',Part1); AttachmentC.Name = "AthO_"..CountSCIFIMOVIELOL
        local AttachmentD=Instance.new('Attachment',Part0); AttachmentD.Name = "AthO_"..CountSCIFIMOVIELOL
        AttachmentC.Orientation = Angle
        AttachmentA.Position = Position
        AlignPos.Attachment1 = AttachmentA;
        AlignPos.Attachment0 = AttachmentB;
        AlignOri.Attachment1 = AttachmentC;
        AlignOri.Attachment0 = AttachmentD;
        CountSCIFIMOVIELOL = CountSCIFIMOVIELOL + 1
    end
    
        game:GetService("Players").LocalPlayer["Character"].Archivable = true 
        local CloneChar = game:GetObjects("rbxassetid://5227463276")[1]
        CloneChar.Parent = workspace 
        CloneChar.HumanoidRootPart.CFrame = game:GetService("Players").LocalPlayer["Character"].HumanoidRootPart.CFrame * CFrame.new(0,0.5,0.1)
        CloneChar.Humanoid.BreakJointsOnDeath = false
        workspace.Camera.CameraSubject = CloneChar.Humanoid 
        CloneChar.Name = "ShibaReanimate" 
        CloneChar.Humanoid.DisplayDistanceType = "None"
        if CloneChar.Head:FindFirstChild("face") then CloneChar.Head:FindFirstChild("face"):Destroy() end
        if workspace[game:GetService("Players").LocalPlayer.Name].Head:FindFirstChild("face") then workspace[game:GetService("Players").LocalPlayer.Name].Head:FindFirstChild("face").Parent = CloneChar.Head end

        local DeadChar = workspace[game:GetService("Players").LocalPlayer.Name]
        if _G.R15Bullet == false then
        DeadChar.HumanoidRootPart:Destroy()
        end
        
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
                if not CloneChar or not CloneChar:FindFirstChild("Head") or not CloneChar:FindFirstChild("Humanoid") or CloneChar:FindFirstChild("Humanoid").Health <= 0 or not DeadChar or not DeadChar:FindFirstChild("Head") or not DeadChar:FindFirstChild("Humanoid") or DeadChar:FindFirstChild("Humanoid").Health <= 0 then 
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
                    end)
                    break
                end		
            end
        end)()
    
        for _,v in next, DeadChar:GetChildren() do
            if v:IsA("Accessory") then
                v:Clone().Parent = CloneChar
            end
        end
    
        for _,v in next, DeadChar:GetDescendants() do
            if v:IsA("Motor6D") and v.Name ~= "Neck" then
                v:Destroy()
            end
        end
        if _G.R15Bullet == true then
            SCIFIMOVIELOL(DeadChar["HumanoidRootPart"],CloneChar["HumanoidRootPart"],Vector3.new(0,0,0),Vector3.new(0,0,0))
        end

        SCIFIMOVIELOL(DeadChar["Head"],CloneChar["Head"],Vector3.new(0,0,0),Vector3.new(0,0,0))
        SCIFIMOVIELOL(DeadChar["UpperTorso"],CloneChar["Torso"],Vector3.new(0,0.2,0),Vector3.new(0,0,0))
        SCIFIMOVIELOL(DeadChar["LowerTorso"],CloneChar["Torso"],Vector3.new(0,-0.78,0),Vector3.new(0,0,0))
        SCIFIMOVIELOL(DeadChar["LeftUpperArm"],CloneChar["Left Arm"],Vector3.new(0,0.375,0),Vector3.new(0,0,0))
        SCIFIMOVIELOL(DeadChar["LeftLowerArm"],CloneChar["Left Arm"],Vector3.new(0,-0.215,0),Vector3.new(0,0,0))
        SCIFIMOVIELOL(DeadChar["LeftHand"],CloneChar["Left Arm"],Vector3.new(0,-0.825,0),Vector3.new(0,0,0))
        SCIFIMOVIELOL(DeadChar["RightUpperArm"],CloneChar["Right Arm"],Vector3.new(0,0.375,0),Vector3.new(0,0,0))
        SCIFIMOVIELOL(DeadChar["RightLowerArm"],CloneChar["Right Arm"],Vector3.new(0,-0.215,0),Vector3.new(0,0,0))
        SCIFIMOVIELOL(DeadChar["RightHand"],CloneChar["Right Arm"],Vector3.new(0,-0.825,0),Vector3.new(0,0,0))
    
        SCIFIMOVIELOL(DeadChar["LeftUpperLeg"],CloneChar["Left Leg"],Vector3.new(0,0.575,0),Vector3.new(0,0,0))
        SCIFIMOVIELOL(DeadChar["LeftLowerLeg"],CloneChar["Left Leg"],Vector3.new(0,-0.137,0),Vector3.new(0,0,0))
        SCIFIMOVIELOL(DeadChar["LeftFoot"],CloneChar["Left Leg"],Vector3.new(0,-0.787,0),Vector3.new(0,0,0))
        SCIFIMOVIELOL(DeadChar["RightUpperLeg"],CloneChar["Right Leg"],Vector3.new(0,0.575,0),Vector3.new(0,0,0))
        SCIFIMOVIELOL(DeadChar["RightLowerLeg"],CloneChar["Right Leg"],Vector3.new(0,-0.137,0),Vector3.new(0,0,0))
        SCIFIMOVIELOL(DeadChar["RightFoot"],CloneChar["Right Leg"],Vector3.new(0,-0.787,0),Vector3.new(0,0,0))
    
        coroutine.wrap(function()
            while true do
                game:GetService("RunService").RenderStepped:wait()
                if HumanDied then break end
                DeadChar["UpperTorso"].CFrame = CloneChar["Torso"].CFrame * CFrame.new(0,0.2,0)
            end
        end)()
    
        for _,v in next, DeadChar:GetChildren() do
            if v:IsA("Accessory") then
                SCIFIMOVIELOL(v.Handle,CloneChar[v.Name].Handle,Vector3.new(0,0,0),Vector3.new(0,0,0))
            end
        end
    
        for _,BodyParts in next, CloneChar:GetDescendants() do
        if BodyParts:IsA("BasePart") or BodyParts:IsA("Part") then
        BodyParts.Transparency = 1 end end
            if _G.R15HeadFix == true then
        DeadChar.Animate:Destroy()
        DeadChar.Humanoid.Animator:Destroy()
            end
    
