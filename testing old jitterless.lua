_G.JitterlessMethod = true
_G.DefaultFling = true
--// Variables
local RunService = game:GetService("RunService") 
local Player = game:GetService("Players").LocalPlayer
local Character = Player.Character
--// Align
local function Attachment(P0,P1,P,R) 
	local APosition = Instance.new("AlignPosition", P0)
	local AOrientation = Instance.new("AlignOrientation", P0)
	local Attachment1 = Instance.new("Attachment", P0)
	local Attachment2 = Instance.new("Attachment", P1)
	APosition.Responsiveness = 999; AOrientation.Responsiveness = 999
	APosition.MaxForce = 9e9; AOrientation.MaxTorque = 9e9
	APosition.Attachment0 = Attachment1;AOrientation.Attachment0 = Attachment1
	APosition.Attachment1 = Attachment2;AOrientation.Attachment1 = Attachment2
	Attachment1.Position = P or Vector3.new(0,0,0); Attachment1.Orientation = R or Vector3.new(0,0,0)
	if _G.JitterlessMethod == true then local BF = Instance.new("BodyForce",P0) end
	RunService.Heartbeat:Connect(function() 
		if _G.JitterlessMethod == true then P0:FindFirstChild("BodyForce").Force = Vector3.new(50,50,50) end
		P0.Velocity = Vector3.new(35,0,0)
	end)
end
--// Setup
Character.Archivable = true
local ReanimCharacter = Character:Clone(); ReanimCharacter.Name = "GelatekReanim";ReanimCharacter.Parent = Character;workspace.Camera.CameraSubject = ReanimCharacter.Humanoid;Character.HumanoidRootPart:Destroy(); for i, v in pairs(ReanimCharacter:GetDescendants()) do if v:IsA("BasePart") or v:IsA("Decal") then v.Transparency = 1 end end
--// Noclip
local Noclip
function NoclipFunc() 
	for i, v in pairs(Character:GetDescendants()) do 
		if v:IsA("BasePart") then v.CanCollide = false end
	end 
end
Noclip = RunService.Stepped:Connect(NoclipFunc)
--// Fling Part
if _G.DefaultFling == true then
	local T1 = Character:FindFirstChild("Torso")
	local T2 = ReanimCharacter:FindFirstChild("Torso")
	RunService.Heartbeat:Connect(function() 
		pcall(function()
		T1.CFrame = T2.CFrame
		T1.Velocity = Vector3.new(5000,4000,5000)
		end)
	end)
end
--// Destroying Hips/Shoulders
Character.Torso["Left Shoulder"]:Destroy();Character.Torso["Right Shoulder"]:Destroy()
Character.Torso["Left Hip"]:Destroy();Character.Torso["Right Hip"]:Destroy()
--// Attaching
function InstantAttach(a,b) Attachment(Character[a],ReanimCharacter[b]) end
InstantAttach("Torso", "Torso")
InstantAttach("Right Arm", "Right Arm");InstantAttach("Left Arm", "Left Arm")
InstantAttach("Right Leg", "Right Leg");InstantAttach("Left Leg", "Left Leg")
for i,v in pairs(Character:GetChildren()) do 
	if v:IsA("Accessory") then 
		v.Handle.AccessoryWeld:Destroy(); Attachment(Character[v.Name].Handle,ReanimCharacter[v.Name].Handle) 
	end
end


--// Ending
_G.Reanimated = true; game.Players.LocalPlayer.Character = ReanimCharacter
--// Died Trigger
game.Players.LocalPlayer.Character.Humanoid.Died:Connect(function() 
	ReanimCharacter:Destroy()
	ReanimCharacter:BreakJoints()
	game.Players.LocalPlayer.Character = workspace[game.Players.LocalPlayer.Name]
	Character:BreakJoints()
	_G.Reanimated = false wait(0.05); workspace.Camera.CameraSubject = Character.Humanoid
end)
