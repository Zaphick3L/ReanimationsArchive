
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
-- R15 Check
if Humanoid.RigType == Enum.HumanoidRigType.R15 then
    game.StarterGui:SetCore("SendNotification",{
    Title = "Gelatek Reanimation",
    Text = "Reanimation supports only R6.",
    Duration = 10
}) end
if game.Players.LocalPlayer.Character:FindFirstChild("GelatekReanimation") or workspace:FindFirstChild("GelatekReanimation") then
    game.StarterGui:SetCore("ChatMakeSystemMessage", {
        Text = "[Gelatek Hub V2] You are already reanimated! Please reset to unreanimate.",
        Color = Color3.fromRGB(255, 10, 70),
        TextSize = 18,
        Font = Enum.Font.Ubuntu
    });
else
Physics.AllowSleep = false
Physics.ThrottleAdjustTime = -9e9
Player.ReplicationFocus = workspace
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
        if Character.GelatekReanimation then
            Character.Torso.CFrame=Character.GelatekReanimation.Torso.CFrame
        end
        sethiddenproperty(game.Players.LocalPlayer, "MaximumSimulationRadius", 1000)
        sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", 1000)
		RightArm.Velocity = Vector3.new(-28.05,1,1)
        RightLeg.Velocity = Vector3.new(-28.05,1,1)
        LeftArm.Velocity = Vector3.new(-28.05,1,1)
        LeftLeg.Velocity = Vector3.new(-28.05,1,1)
        Torso.Velocity = Vector3.new(12000,12000,12000)
        HumanoidRootPart.Velocity = Vector3.new(-28.05,1,1)
        for _, Accessories in pairs(Character:GetDescendants()) do
            if Accessories:IsA("Accessory") then
                Accessories.Handle.Velocity = Vector3.new(-28.05,1,1)
            end
	end
	
    end
end)

local CopyCharacter = Character:Clone()
CopyCharacter.Parent = Character
CopyCharacter.Name = "GelatekReanimation"

for k,l in pairs(Character.GelatekReanimation:GetDescendants()) do 
    if l:IsA("Part") or l:IsA("Decal") then
    l.Transparency=1
end
end

Character.Torso["Left Shoulder"]:Destroy()
Character.Torso["Right Shoulder"]:Destroy()
Character.Torso["Left Hip"]:Destroy()
Character.Torso["Right Hip"]:Destroy()
HumanoidRootPart.RootJoint:Destroy()
--  Using Mizt's align
local CountSCIFIMOVIELOL = 1
function AlignCharacter(Part0,Part1,Position,Angle)
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

AlignCharacter(Torso,CopyCharacter["Torso"],Vector3.new(0,0,0),Vector3.new(0,0,0))
AlignCharacter(HumanoidRootPart,CopyCharacter["HumanoidRootPart"],Vector3.new(0,0,0),Vector3.new(0,0,0))
AlignCharacter(LeftArm,CopyCharacter["Left Arm"],Vector3.new(0,0,0),Vector3.new(0,0,0))
AlignCharacter(RightArm,CopyCharacter["Right Arm"],Vector3.new(0,0,0),Vector3.new(0,0,0))
AlignCharacter(LeftLeg,CopyCharacter["Left Leg"],Vector3.new(0,0,0),Vector3.new(0,0,0))
AlignCharacter(RightLeg,CopyCharacter["Right Leg"],Vector3.new(0,0,0),Vector3.new(0,0,0))
CopyCharacter:FindFirstChild("HumanoidRootPart").Anchored = false
spawn(function() 
    while true do wait()
        if Character:FindFirstChild("Humanoid").Health == 0 then 
                Character:BreakJoints()
                CopyCharacter:BreakJoints()
        end
    end 
end)


function nocol(t)
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
        nocol(l)
    end 
end


Torso.Anchored = true
LeftArm.Anchored = true
RightArm.Anchored = true
LeftLeg.Anchored = true
RightLeg.Anchored = true
Head.Anchored = true

for k=0,30 do wait()
    CopyCharacter.HumanoidRootPart.RotVelocity = Vector3.new(0,0,0)
    CopyCharacter.HumanoidRootPart.Velocity = Vector3.new(0,0,0)
end

Character.Animate.Disabled = true

game:GetService("UserInputService").JumpRequest:connect(function(t)
    if CopyCharacter.Humanoid.FloorMaterial~=Enum.Material.Air then 
        CopyCharacter.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
        game.Players.LocalPlayer.Character.GelatekReanimation:FindFirstChildOfClass('Humanoid').Sit=false 
    end 
end)

game.RunService.RenderStepped:Connect(function()
    CopyCharacter.Humanoid:Move(Character.Humanoid.MoveDirection,false)
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
end
