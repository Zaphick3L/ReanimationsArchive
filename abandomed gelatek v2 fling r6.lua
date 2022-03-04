
local RunService = game:GetService("RunService") 
local Player = game:GetService("Players").LocalPlayer
local Character = Player.Character
--// Align
local function Attachment(P0,P1,P,R) 
	local APosition = Instance.new("AlignPosition", P0)
	local AOrientation = Instance.new("AlignOrientation", P0)
	local Attachment1 = Instance.new("Attachment", P0)
	local Attachment2 = Instance.new("Attachment", P1)
	APosition.Responsiveness = 200; AOrientation.Responsiveness = 200
	APosition.MaxForce = 5e9; AOrientation.MaxTorque = 5e9
	APosition.Attachment0 = Attachment1;AOrientation.Attachment0 = Attachment1
	APosition.Attachment1 = Attachment2;AOrientation.Attachment1 = Attachment2
	Attachment1.Position = P or Vector3.new(0,0,0); Attachment1.Orientation = R or Vector3.new(0,0,0)
	if _G.DecreaseJitter == true then
		local a = Instance.new("BodyForce", P0)
		a.Force = Vector3.new(80,80,80)
	end
end
--// Setup
Character.Archivable = true
local ReanimCharacter = Character:Clone(); ReanimCharacter.Name = "GelatekReanim";ReanimCharacter.Parent = Character;workspace.Camera.CameraSubject = ReanimCharacter.Humanoid;Character.HumanoidRootPart:Destroy(); for i, v in pairs(ReanimCharacter:GetDescendants()) do if v:IsA("BasePart") or v:IsA("Decal") then v.Transparency = 1 end end
--// Noclip
local Noclip
function NoclipFunc() 
	for i, v in pairs(Character:GetDescendants()) do 
		if v:IsA("BasePart") and v.Name ~= "Right Arm" then v.CanCollide = false end
	end 
end
Noclip = RunService.Stepped:Connect(NoclipFunc)
local fake = Character["Pal Hair"]
fake.Handle:ClearAllChildren()
Attachment(fake.Handle, ReanimCharacter["Right Arm"], Vector3.new(0, 0, 0), Vector3.new(90, 0, 0))
--// Destroying Hips/Shoulders
Character.Torso["Left Shoulder"]:Destroy();Character.Torso["Right Shoulder"]:Destroy()
Character.Torso["Left Hip"]:Destroy();Character.Torso["Right Hip"]:Destroy()
--// Attaching
function InstantAttach(a,b) Attachment(Character[a],ReanimCharacter[b]) end
if _G.HeadMovement == true then
local Hat = Character['Dark Matter Head'].Handle
Hat.AccessoryWeld:Destroy()
Attachment(Character["Torso"],ReanimCharacter["Torso"],Vector3.new(),Vector3.new(0,0,180))
Attachment(Hat,ReanimCharacter["Head"])
else
InstantAttach("Torso", "Torso")
end
InstantAttach("Right Arm", "Right Arm");InstantAttach("Left Arm", "Left Arm")
InstantAttach("Right Leg", "Right Leg");InstantAttach("Left Leg", "Left Leg")

Character.Humanoid:ChangeState(18)
--// Ending/Movement
_G.Reanimated = true
local Humanoid = ReanimCharacter:FindFirstChild("Humanoid")
workspace.Camera.CameraSubject = Humanoid
    game:GetService("UserInputService").JumpRequest:connect(function()
        if Humanoid.FloorMaterial ~= Enum.Material.Air then 
            Humanoid:ChangeState(Enum.HumanoidStateType.Jumping) Humanoid.Sit = false 
        end 
    end)
    game:GetService('RunService').RenderStepped:Connect(function()
        Humanoid:Move(Character.Humanoid.MoveDirection, false)
        local AnimationTracks = Character.Humanoid:GetPlayingAnimationTracks()
            for n,Anims in pairs(AnimationTracks) do 
                Anims:Stop()
		end 
end)
local Netlessing
function Netless()
for i,v in next, workspace[game.Players.LocalPlayer.Name]:GetChildren() do
		if v:IsA("BasePart") and v.Name ~= "Right Arm" then 
			v.Velocity = Vector3.new(0,-32.5,0)
		elseif v:IsA("Accessory") then 
			v.Handle.Velocity = Vector3.new(0,-32.5,0)
		end
	end
end

Netlessing = game:GetService("RunService").Heartbeat:Connect(Netless)

--// Died Trigger
game.Players.LocalPlayer.Character.Humanoid.Died:Connect(function() 
	ReanimCharacter:Destroy()
	ReanimCharacter:BreakJoints()
	Netlessing:Disconnect()
	game.Players.LocalPlayer.Character = workspace[game.Players.LocalPlayer.Name]
	Character:BreakJoints()
	_G.Reanimated = false wait(0.05); workspace.Camera.CameraSubject = Character.Humanoid
end)
