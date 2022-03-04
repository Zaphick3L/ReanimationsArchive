if workspace[game.Players.LocalPlayer.Name]:FindFirstChild("Raw") then
		local sound = Instance.new("Sound", game.StarterGui)
		sound.SoundId = "rbxassetid://8426701399"
		sound.Volume = 3
		sound:Play()
		game.StarterGui:SetCore("SendNotification", {
			Title = "Gelatek Reanimation",
			Text = "Already Reanimated! Reset to unreanimate."
		})
		wait(2)
		sound:Destroy()
		return
end

spawn(function()
	for _,v in pairs(game.Players.LocalPlayer.Character.Humanoid:GetDescendants()) do
		if v:IsA("NumberValue") then v:Destroy() end
	end
end)
wait()



local Stepped = game:GetService("RunService").Stepped
local Heartbeat = game:GetService("RunService").Heartbeat
local InputService = game:GetService("UserInputService")
local Player = game:GetService("Players").LocalPlayer
local Character = workspace[Player.Name]
local Humanoid = Character:FindFirstChildOfClass("Humanoid")
local Torso = Character:FindFirstChild("Torso") or Character:FindFirstChild("UpperTorso")
	

Character.Archivable = true
Character.Animate.Disabled = true
local Clone = game:GetObjects('rbxassetid://8440552086')[1]
Clone.Parent = workspace
Clone.Name = "Raw" -- inspired by shiba hahahgahahfawfhuaegi
Clone.HumanoidRootPart.CFrame = Torso.CFrame
for _,v in pairs(Clone:GetDescendants()) do
	if v:IsA("BasePart") or v:IsA("Decal") then
		v.Transparency = 1
	end
end
Character.HumanoidRootPart.Transparency = 0
-- Variables
local CloneTorso = Clone:FindFirstChild("Torso")
local CloneHumanoid = Clone:FindFirstChildOfClass("Humanoid")
-- Noclip
local NCTrigger;
function NoCollide()
	for _,v in pairs(Character:GetDescendants()) do
		if v:IsA("BasePart") or v:IsA("MeshPart") then
			v.CanCollide = false
		end
	end
	for _,v in pairs(Humanoid:GetPlayingAnimationTracks()) do
		v:Stop()
	end
	CloneHumanoid:Move(Humanoid.MoveDirection, false)
end
NCTrigger = Stepped:Connect(NoCollide)

-- Motor6D Destroyer
for _,v in pairs(Character:GetDescendants()) do
	if v:IsA("Motor6D") and v.Name ~= "Neck" then
		v:Destroy()
	end
end
wait()
Clone.Parent = Character

	

local MTrigger

function Main()
	-- Netless
	for _,v in pairs(Character:GetChildren()) do
		if v:IsA("BasePart") or v:IsA("MeshPart") and v.Name ~= "Torso" then
			v.Velocity = Vector3.new(33.5,0,0)
		elseif v:IsA("Accessory") then
			v.Handle.Velocity = Vector3.new(33.5,0,0)
		end
	end
	if Humanoid.RigType == Enum.HumanoidRigType.R6 then
	Torso.Velocity = Vector3.new(1500,1500,1500)
	else
	Character.HumanoidRootPart.RotVelocity = Vector3.new(2500,2500,2500)
	end
	-- CFrame Reanimate:
	if Humanoid.RigType == Enum.HumanoidRigType.R6 then
		pcall(function()
			Character['Right Arm'].CFrame = Clone['Right Arm'].CFrame 
			Character['Left Arm'].CFrame = Clone['Left Arm'].CFrame 
			Character['Right Leg'].CFrame = Clone['Right Leg'].CFrame 
			Character['Left Leg'].CFrame = Clone['Left Leg'].CFrame 
			Character['Torso'].CFrame = Clone['Torso'].CFrame 
		end)
	else
		pcall(function()
			Character["UpperTorso"].CFrame = Clone["Torso"].CFrame * CFrame.new(0,0.195,0)
			Character.HumanoidRootPart.CFrame = Character["UpperTorso"].CFrame + Vector3.new(0,-0.16,0)
			Character["LowerTorso"].CFrame = Clone["Torso"].CFrame * CFrame.new(0,-0.76,0)
			
			Character['RightUpperArm'].CFrame = Clone['Right Arm'].CFrame * CFrame.new(0,0.41,0)
			Character['RightLowerArm'].CFrame = Clone['Right Arm'].CFrame * CFrame.new(0,-0.16,0)
			Character['RightHand'].CFrame = Clone['Right Arm'].CFrame * CFrame.new(0,-0.8,0)
			
			Character['LeftUpperArm'].CFrame = Clone['Left Arm'].CFrame * CFrame.new(0,0.41,0)
			Character['LeftLowerArm'].CFrame = Clone['Left Arm'].CFrame * CFrame.new(0,-0.16,0)
			Character['LeftHand'].CFrame = Clone['Left Arm'].CFrame * CFrame.new(0,-0.8,0)
			
			Character['RightUpperLeg'].CFrame = Clone['Right Leg'].CFrame * CFrame.new(0,0.6,0)
			Character['RightLowerLeg'].CFrame = Clone['Right Leg'].CFrame * CFrame.new(0,-0.15,0)
			Character['RightFoot'].CFrame = Clone['Right Leg'].CFrame * CFrame.new(0,-0.85,0)
			  
			Character['LeftUpperLeg'].CFrame = Clone['Left Leg'].CFrame * CFrame.new(0,0.6,0)
			Character['LeftLowerLeg'].CFrame = Clone['Left Leg'].CFrame * CFrame.new(0,-0.15,0)
			Character['LeftFoot'].CFrame = Clone['Left Leg'].CFrame * CFrame.new(0,-0.85,0)
		end)
	end
end
-- JumpRequest
InputService.JumpRequest:Connect(function()
	pcall(function()
		CloneHumanoid.Jump = true
		CloneHumanoid.Sit = false
		Humanoid.Sit = false
	end)
end)
if Humanoid.RigType == Enum.HumanoidRigType.R6 then
	Character.HumanoidRootPart:Destroy()
end

MTrigger = Heartbeat:Connect(Main)
Humanoid.Died:Connect(function()
	MTrigger:Disconnect()
	NCTrigger:Disconnect()
	Clone:BreakJoints()
	if workspace:FindFirstChildOfClass("Camera") then
		workspace.Camera.CameraSubject = Humanoid
	end
end)
if _G.EnableAnimations == true then
loadstring(game:HttpGet("https://raw.githubusercontent.com/Zaphick3L/MiscStuff/main/Anims.lua"))() -- Animations
end

if workspace:FindFirstChildOfClass("Camera") then
	workspace.Camera.CameraSubject = CloneHumanoid
end

local sound = Instance.new("Sound", game.StarterGui)
sound.SoundId = "rbxassetid://8260787988"
sound.Volume = 3
sound:Play()
game.StarterGui:SetCore("SendNotification", {
	Title = "Gelatek Reanimation",
	Text = "Successfully Reanimated with Fling Reanimate! Reset to un-reanimate"
})
wait(2)
sound:Destroy()
