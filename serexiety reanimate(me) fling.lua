if workspace[game.Players.LocalPlayer.Name]:FindFirstChild("SerexietyReanimation") then
	local sound = Instance.new("Sound", game.StarterGui)
	sound.SoundId = "rbxassetid://8426701399"
	sound.Volume = 3
	sound:Play()
	game.StarterGui:SetCore("SendNotification", {
		Title = "Serexiety Reanimation",
		Text = "Already Reanimated! Reset to unreanimate."
	})
	wait(2)
	sound:Destroy()
	return
end

local function align(part0,part1,position,orientation)
for i,_ in pairs(part0:GetChildren()) do
    if _:IsA("Motor6D") and _.Name ~= "Neck" then _:Destroy() end
end
Instance.new("AlignPosition", part0)
part0.AlignPosition.Name = "SerexietyAlignPosition"
part0.SerexietyAlignPosition.RigidityEnabled = true
Instance.new("AlignOrientation", part0)
part0.AlignOrientation.Name = "SerexietyAlignOrientation"
part0.SerexietyAlignOrientation.MaxTorque = 9999999999
part0.SerexietyAlignOrientation.Responsiveness = 200

Instance.new("Attachment", part0)
part0.Attachment.Name = "SerexityAttachmentP0"
Instance.new("Attachment", part1)
part1.Attachment.Name = "SerexityAttachmentP1"
part0.SerexietyAlignPosition.Attachment0 = part0.SerexityAttachmentP0
part0.SerexietyAlignPosition.Attachment1 = part1.SerexityAttachmentP1

part0.SerexietyAlignOrientation.Attachment0 = part0.SerexityAttachmentP0
part0.SerexietyAlignOrientation.Attachment1 = part1.SerexityAttachmentP1
part0.SerexityAttachmentP0.Position = position or Vector3.new(0,0,0)
part0.SerexityAttachmentP0.Orientation = orientation or Vector3.new(0,0,0)
end

local s = game:GetService("RunService")
local p = game.Players.LocalPlayer
local c = workspace[p.Name]
local h = c:FindFirstChildOfClass("Humanoid")
local t = c:FindFirstChild("Torso") or c:FindFirstChild("UpperTorso")
spawn(function()	
	for i,_ in pairs(h:GetDescendants()) do
		if _:IsA("NumberValue") then _:Destroy() end
	end
end)
c.Archivable = true
local r = game:GetObjects('rbxassetid://8440552086')[1]
r.Parent = c
r.Name = "SerexietyReanimation"
c.Animate.Disabled = true
for i,_ in pairs(r:GetDescendants()) do
	if _:IsA("BasePart") or _:IsA("Decal") then
		_.Transparency = 1
	end
end

local nc;
local function noclip()
	for i,_ in pairs(c:GetDescendants()) do
		if _:IsA("BasePart") or _:IsA("MeshPart") then
			_.CanCollide = false
		end
	end
	for i,_ in pairs(h:GetPlayingAnimationTracks()) do
		_:Stop()
	end
end
local vel;
local function velocity()
	for i,_ in pairs(c:GetChildren()) do
		if _:IsA("BasePart") or _:IsA("MeshPart") and v.Name ~= "UpperTorso" and v.Name ~= "Torso" then
			_.Velocity = Vector3.new(35,0,0)
		elseif _:IsA("Accessory") then
			_.Handle.Velocity = Vector3.new(35,0,0)
		end
	end
	t.Velocity = Vector3.new(3000,3000,3000)
	if h.RigType == Enum.HumanoidRigType.R15 then
		pcall(function()
			c.HumanoidRootPart.CFrame = t.CFrame
			t.CFrame = r.Torso.CFrame + Vector3.new(0,0.19,0)
		end)
	else
		pcall(function()
			t.CFrame = r.Torso.CFrame
		end)
	end
end
nc = s.Stepped:Connect(noclip)
vel = s.Heartbeat:Connect(velocity)
h.Died:Connect(function()
	nc:Disconnect()
	vel:Disconnect()
	wait()
	h:ChangeState(15)
	game.Players.LocalPlayer.Character = workspace[game.Players.LocalPlayer.Name]
	r:Destroy()
end)
local function alr6(part0)
	align(c[part0],r[part0])
end
local function alr15(part0,part1,y)
	align(c[part0],r[part1],Vector3.new(0,y,0))
end
local function alhat(part0,part1,position,orientation)
	align(c[part0],r[part1],position)
end
r.HumanoidRootPart.CFrame = c.HumanoidRootPart.CFrame
wait(.1)
if h.RigType == Enum.HumanoidRigType.R6 then
c.HumanoidRootPart:Destroy()
alr6("Torso")
alr6("Right Arm")
alr6("Left Arm")
alr6("Right Leg")
alr6("Left Leg")
else
alr15("RightUpperArm","Right Arm",-0.4)
alr15("RightLowerArm","Right Arm",0.19)
alr15("RightHand","Right Arm",0.8)

alr15("LeftUpperArm","Left Arm",-0.4)
alr15("LeftLowerArm","Left Arm",0.19)
alr15("LeftHand","Left Arm",0.8)

alr15("RightUpperLeg","Right Leg",-0.6)
alr15("RightLowerLeg","Right Leg",0.18)
alr15("RightFoot","Right Leg",0.85)

alr15("LeftUpperLeg","Left Leg",-0.6)
alr15("LeftLowerLeg","Left Leg",0.18)
alr15("LeftFoot","Left Leg",0.85)

alr15("LowerTorso","Torso",0.75)
alr15("UpperTorso","Torso",0)

end
loadstring(game:HttpGet("https://pastebin.com/raw/nM8Mp7Q9"))()

workspace.Camera.CameraSubject = r.Humanoid

game.Players.LocalPlayer.Character = r

local sound = Instance.new("Sound", game.StarterGui)
sound.SoundId = "rbxassetid://8260787988"
sound.Volume = 3
sound:Play()
game.StarterGui:SetCore("SendNotification", {
	Title = "Serexiety Reanimation",
	Text = "Successfully Reanimated! Reset to unreanimate."
})
wait(2)
sound:Destroy()
