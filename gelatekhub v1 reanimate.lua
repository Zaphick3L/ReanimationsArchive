-- this is so skidded lmfao
-- credits: typicalusername, mizt
-- ill not credit myself here because i did nothing here.
-- it was 1 year ago so dont make cw on me pls
HumanDied = false
    local torsopossss = game:FindFirstChildOfClass("Players").LocalPlayer["Character"].Torso.Position
   	
    local hatnameclone = {}
    for _,v in next, game:FindFirstChildOfClass("Players").LocalPlayer["Character"]:GetChildren() do
        if v:IsA("Accessory") then
            if hatnameclone[v.Name] then
                if hatnameclone[v.Name] == "s" then
                    hatnameclone[v.Name] = {}
                end
                table.insert(hatnameclone[v.Name],v)
            else
                hatnameclone[v.Name] = "s"
            end
        end
    end
    for _,v in pairs(hatnameclone) do
        if type(v) == "table" then
            local num = 1
            for _,w in pairs(v) do
                w.Name = w.Name..num
                num = num + 1
            end
        end
    end
    hatnameclone = nil

    
    
    local CountSCIFIMOVIELOL = 1
    function SCIFIMOVIELOL(Part0,Part1,Position,Angle)
        game['Run Service'].Heartbeat:Connect(function()
            Part0.Velocity = Vector3.new(35,0,3.5)
			setsimulationradius(1000)
        end)
        local AlignPos = Instance.new('AlignPosition', Part1); AlignPos.Name = "AliP_"..CountSCIFIMOVIELOL
        AlignPos.ApplyAtCenterOfMass = true;
        AlignPos.MaxForce = 5772000--67752;
        AlignPos.MaxVelocity = math.huge/9e110;
        AlignPos.ReactionForceEnabled = false;
        AlignPos.Responsiveness = 200;
        AlignPos.RigidityEnabled = false;
        local AlignOri = Instance.new('AlignOrientation', Part1); AlignOri.Name = "AliO_"..CountSCIFIMOVIELOL
        AlignOri.MaxAngularVelocity = math.huge/9e110;
        AlignOri.MaxTorque = 5772000
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
        CloneChar.Name = "GelatekReanimation" 
        CloneChar.Humanoid.DisplayDistanceType = "None"
        if CloneChar.Head:FindFirstChild("face") then CloneChar.Head:FindFirstChild("face").Transparency = 1 end
        --if workspace[game:GetService("Players").LocalPlayer.Name].Head:FindFirstChild("face") then workspace[game:GetService("Players").LocalPlayer.Name].Head:FindFirstChild("face").Parent = CloneChar.Head end
    
        FalseChar:Destroy()
    
        local DeadChar = workspace[game:GetService("Players").LocalPlayer.Name]
    
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
        workspace["GelatekReanimation"].Humanoid.WalkToPoint = LVecPart.Position
        end
        
        _G.permadeath = true
    
        coroutine.wrap(function() 
        while true do game:GetService("RunService").RenderStepped:Wait()
        if HumanDied then break end
        if WDown then MoveClone(0,0,1e4) end
        if ADown then MoveClone(1e4,0,0) end
        if SDown then MoveClone(0,0,-1e4) end
        if DDown then MoveClone(-1e4,0,0) end
        if SpaceDown then CloneChar["Humanoid"].Jump = true end
        if WDown ~= true and ADown ~= true and SDown ~= true and DDown ~= true then
        workspace["GelatekReanimation"].Humanoid.WalkToPoint = workspace["GelatekReanimation"].HumanoidRootPart.Position end
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
                        _G.permadeath = false
                        DeadChar.Humanoid.Health = 0
                    end)
                    break
                end		
            end
        end)()
    
        SCIFIMOVIELOL(DeadChar["Head"],CloneChar["Head"],Vector3.new(0,0,0),Vector3.new(0,0,0))
        SCIFIMOVIELOL(DeadChar["Torso"],CloneChar["Torso"],Vector3.new(0,0,0),Vector3.new(0,0,0))
        SCIFIMOVIELOL(DeadChar["Left Arm"],CloneChar["Left Arm"],Vector3.new(0,0,0),Vector3.new(0,0,0))
        SCIFIMOVIELOL(DeadChar["Right Arm"],CloneChar["Right Arm"],Vector3.new(0,0,0),Vector3.new(0,0,0))
        SCIFIMOVIELOL(DeadChar["Left Leg"],CloneChar["Left Leg"],Vector3.new(0,0,0),Vector3.new(0,0,0))
        SCIFIMOVIELOL(DeadChar["Right Leg"],CloneChar["Right Leg"],Vector3.new(0,0,0),Vector3.new(0,0,0))
        --SCIFIMOVIELOL(DeadChar["HumanoidRootPart"],CloneChar["HumanoidRootPart"],Vector3.new(0,0,0),Vector3.new(0,0,0))
  
   
    
    
        for _,v in next, DeadChar:GetChildren() do
            if v:IsA("Accessory") then
                for i,wa in pairs(v:GetDescendants())do
                    if wa:IsA("Attachment") or wa:IsA("Weld") then
                        wa:Destroy()
                    end
                end
                v.Handle.CanCollide = true
                SCIFIMOVIELOL(v.Handle,CloneChar[v.Name].Handle,Vector3.new(0,0,0),Vector3.new(0,0,0))
            end
        end
    
        for _,BodyParts in next, CloneChar:GetDescendants() do
        if BodyParts:IsA("BasePart") or BodyParts:IsA("Part") then
        BodyParts.Transparency = 1 end end
        wait(0.1)
        local clon = game:GetService("Workspace").GelatekReanimation.HumanoidRootPart:Clone()
        clon.Parent = game.Players.LocalPlayer.Character
        --game.Players.LocalPlayer.Character=workspace.non
		
game:GetService("StarterGui"):SetCore("SendNotification", {
Title = "Gelatek Hub V2",
Text = "Reanimation made by: realq#5074, reset to change script"
}
)
