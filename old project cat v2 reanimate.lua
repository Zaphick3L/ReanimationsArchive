--[[
-----------------//// Updates:
1.3.2:
[ + ] Added Velocity to Accessories.
[ + ] Anti-Run Trigger if you have already ran the reanimate.
1.3.1:
[ * ] BugFix with AlignPosition Parent
1.3:
[ + ] New Animate Script for Animations.
[ - ] Removed ProductionTakeOne from credits (I was using his Animate back then.)
[ * ] Fling Force increased (3500 > 4000)
[ + ] Made the UpdateLog more Readable.
[ * ] Updated Credits, added reanimation version as well.
[ * ] BugFix with some strings.
[ * ] Changed default align values. (MaxForce/MaxTorque (700000000 > 9e9))
1.2.3:
[ * ] Fixed Camera.
1.1.2:
[ + ] Added Anti Tool to avoid breaking on r15.
[ * ] Changed default align values. (MaxForce/MaxTorque (76007600 > 700000000))
1.1.1:
[ * ] Credits time 2 > 1.5
[ - ] Removed Useless global.
1.1.0:
[ + ] Added Credits.
[ + ] Custom Velocity.
[ * ] Bugfix with bullet .
[ + ] Jump support.
1.0.0:
[ + ] Released.


Credits:
Gelatek (Everything)
]]--

if game.Players.LocalPlayer.Character:FindFirstChild("GelatekReanimate") then
	local CreditsFail = Instance.new("Message", workspace)
	CreditsFail.Text = "You have been already Reanimated!, Reset to Un-Reanimate."
	wait(1.5)
	CreditsFail:Destroy()
	return
end
if not _G.Velocity then _G.Velocity = Vector3.new(0,-36.5,0) end
if not _G.Fling then _G.Fling = false end
if not _G.Bullet then _G.Bullet = false end
if not _G.RigEnabled then _G.RigEnabled = false end
if not _G.Net then _G.Net = false end
if not _G.NoNetless then _G.NoNetless = false end
if not _G.RemoveAnims then _G.RemoveAnims = false end
if not _G.Physics then _G.Physics = false end
function Attach(P0,P1,Position,Orientation)
	for i, v in pairs(P0:GetChildren()) do
        if v:IsA("Motor6D") and v.Name ~= "Neck" then v:Destroy() end
	end
   local AP = Instance.new("AlignPosition")
   AP.Parent = P0
   AP.MaxForce = 9e9
   AP.Responsiveness = 200
   AP.MaxVelocity = math.huge
   AP.ApplyAtCenterOfMass = false
   AP.RigidityEnabled = false
   
   AP.Name = "Position"
   
   local AO = Instance.new("AlignOrientation")
   AO.Parent = P0
   AO.MaxTorque = 9e9
   AO.Responsiveness = 200
   AO.MaxAngularVelocity = math.huge
   AO.RigidityEnabled = false
   AO.Name = "Orientation"
   
    if _G.RigEnabled == true then
    	 AP.RigidityEnabled = true
   	end
   local Attachment1 = Instance.new("Attachment")
   Attachment1.Parent = P0
   Attachment1.Name = "Attach"
   Attachment1.Position = Position or Vector3.new(0,0,0)
   Attachment1.Orientation = Orientation or Vector3.new(0,0,0)
   local Attachment2 = Instance.new("Attachment")
   Attachment2.Parent = P1
   Attachment2.Name = "Attach"

   
   AP.Attachment0 = Attachment1
   AP.Attachment1 = Attachment2
   
   AO.Attachment0 = Attachment1
   AO.Attachment1 = Attachment2
end

local Character = game.Players.LocalPlayer.Character; Character.Archivable = true
local Clone = game:GetObjects('rbxassetid://8440552086')[1]
Clone.Parent = Character; Clone.Name = "GelatekReanimate"
for _, v in pairs(Clone:GetDescendants()) do if v:IsA("BasePart") or v:IsA("Decal") then
	v.Transparency = 1
end end
local Torso = Character:FindFirstChild("Torso") or Character:FindFirstChild("UpperTorso")
local CloneTorso = Clone:FindFirstChild("Torso")
local Humanoid = Character:FindFirstChild("Humanoid")
local CloneHumanoid = Clone:FindFirstChild("Humanoid")
local Root = Character:FindFirstChild("HumanoidRootPart")
Clone.HumanoidRootPart.CFrame = Character.HumanoidRootPart.CFrame
local TriggerNoclip
local TriggerNetless
function Noclip()
	for _,v in pairs(Character:GetDescendants()) do
		if v:IsA("BasePart") then v.CanCollide = false end
	end

	for _,v in pairs(Humanoid:GetPlayingAnimationTracks()) do
		v:Stop()
	end
end
TriggerNoclip = game:GetService("RunService").Stepped:Connect(Noclip)

function Netless()
	for _,v in pairs(Character:GetChildren()) do
		if v:IsA("MeshPart") or v:IsA("BasePart") and v.Name ~= "HumanoidRootPart" then
			if _G.NoNetless == false and _G.Fling == false then
				v.Velocity = _G.Velocity or Vector3.new(25.05,25.05,25.05)
			elseif _G.NoNetless == false and _G.Fling == true then
				v.Velocity = _G.Velocity or Vector3.new(25.05,25.05,25.05)
				Torso.RotVelocity = Vector3.new(4000,4000,4000)
			elseif _G.NoNetless == true and _G.Fling == false then
				
			elseif _G.NoNetless == true and _G.Fling == true then
				Torso.RotVelocity = Vector3.new(4000,4000,4000)
			end
	elseif v:IsA("Accessory") then
		if _G.NoNetless == false then
			v.Handle.Velocity = _G.Velocity or Vector3.new(25.05,25.05,25.05)
		elseif _G.NoNetless == true then

		end
	end
			end	
		pcall(function()
		CloneHumanoid:Move(Humanoid.MoveDirection, false)
		if Humanoid.RigType == Enum.HumanoidRigType.R6 then
		 Torso.CFrame = CloneTorso.CFrame
		elseif Humanoid.RigType == Enum.HumanoidRigType.R15 then
			Torso.CFrame = CloneTorso.CFrame * CFrame.new(0,0.19,0)
			Root.CFrame = Torso.CFrame * CFrame.new(0,-0.15,0)
			
		end
	end)
		for _,v in pairs(Humanoid:GetPlayingAnimationTracks()) do
		v:Stop()
	end
end
TriggerNetless = game:GetService("RunService").Heartbeat:Connect(Netless)
game:GetService("UserInputService").JumpRequest:Connect(function()
	pcall(function()
		CloneHumanoid.Jump = true
		CloneHumanoid.Sit = false
	end)
end)
Humanoid.Died:Connect(function()
	TriggerNoclip:Disconnect()
	TriggerNetless:Disconnect()
end)

Character.ChildAdded:Connect(function(tool)
    if tool:IsA("Tool") then tool:Destroy() end
end)

if workspace:FindFirstChildOfClass("Camera") then
	workspace.Camera.CameraSubject = CloneHumanoid
end

if Humanoid.RigType == Enum.HumanoidRigType.R6 then
	Character.HumanoidRootPart:Destroy()
	Attach(Character.Torso,Clone.Torso)
	Attach(Character["Right Arm"],Clone["Right Arm"])
	Attach(Character["Left Arm"],Clone["Left Arm"])
	Attach(Character["Right Leg"],Clone["Right Leg"])
	Attach(Character["Left Leg"],Clone["Left Leg"])
	if _G.Bullet == true then
		if not Character:FindFirstChild("Pal Hair") then
			print("Required Pal Hair!")
            return
		end
		Humanoid:ChangeState("Physics")
		local faker = Character:FindFirstChild("Pal Hair").Handle
		faker.AccessoryWeld:Destroy()
		faker.Mesh:Destroy()
		Attach(faker,Clone["Right Arm"],Vector3.new(0,0,0),Vector3.new(90,0,0))
		Character["Right Arm"].Name = "Bullet"
	end
else
    for _,v in pairs(Humanoid:GetChildren()) do
        if v:IsA("NumberValue") then v:Destroy() end
    end
        Character.Animate.Disabled = true
    Attach(Character.UpperTorso, Clone['Torso'],Vector3.new(0, 0.15, 0))
    Attach(Character.LowerTorso, Clone['Torso'],Vector3.new(0, 0.75, 0))
    Attach(Character.LeftUpperArm, Clone['Left Arm'],Vector3.new(0, -0.405, 0)) 
    Attach(Character.LeftLowerArm, Clone['Left Arm'],Vector3.new(0, 0.18, 0))
    Attach(Character.LeftHand, Clone['Left Arm'],Vector3.new(0, 0.8, 0))
    Attach(Character.RightUpperArm, Clone['Right Arm'],Vector3.new(0, -0.405, 0))
    Attach(Character.RightLowerArm, Clone['Right Arm'],Vector3.new(0, 0.18, 0))
    Attach(Character.RightHand, Clone['Right Arm'],Vector3.new(0, 0.8, 0))
    Attach(Character.LeftUpperLeg, Clone['Left Leg'],Vector3.new(0, -0.6, 0))
    Attach(Character.LeftLowerLeg, Clone['Left Leg'],Vector3.new(0, 0.15, 0))
    Attach(Character.LeftFoot, Clone['Left Leg'],Vector3.new(0, 0.85, 0))
    Attach(Character.RightUpperLeg, Clone['Right Leg'],Vector3.new(0, -0.6, 0))
    Attach(Character.RightLowerLeg, Clone['Right Leg'],Vector3.new(0, 0.15, 0))
    Attach(Character.RightFoot, Clone['Right Leg'],Vector3.new(0, 0.85, 0))
    if _G.Bullet == true then
		Humanoid:ChangeState("Physics")
		Character["LowerTorso"].Name = "Bullet"
	end
end

local Credits = Instance.new("Message", workspace)
Credits.Text = "Reanimation by Gelatek! Current Version: 1.3.2"
wait(1.5)
Credits:Destroy()
if _G.RemoveAnims == false then
	loadstring(game:HttpGet("https://raw.githubusercontent.com/Zaphick3L/ProjectCatV2/main/Utilities/R15ToR6Animate.lua"))()
end
