setfpscap(50)
-- =====================================================
-- 🔐 ASTRO KEY + WHITELIST GATE
-- =====================================================
local Players = game:GetService("Players")
local CoreGui = game:GetService("CoreGui")
local lp = Players.LocalPlayer

-- =============================
-- SIMPLE OBFUSCATION
-- =============================
local function enc(s)
	local t = {}
	for i = 1, #s do
		t[i] = string.char(s:byte(i) + 4)
	end
	return table.concat(t):reverse()
end

local function dec(s)
	s = s:reverse()
	local t = {}
	for i = 1, #s do
		t[i] = string.char(s:byte(i) - 4)
	end
	return table.concat(t)
end

-- =============================
-- 🔑 50 RANDOMIZED ASTRO KEYS
-- =============================
local OBF_KEYS = {
	enc("ASTRO-H)-&93!?-$/@,9baPHAGAB!x"),
	enc("ASTRO-Q!$7@^ZAp,9x&L"),
	enc("ASTRO-X@!9$^7Z,ApQx"),
	enc("ASTRO-P$!@7^9Z,AxQ"),
	enc("ASTRO-M@!9$7^Ap,Zx"),
	enc("ASTRO-K!@7$^9Z,ApQ"),
	enc("ASTRO-B@!9$7^ZAp,x"),
	enc("ASTRO-Z!@7$^9Ap,Qx"),
	enc("ASTRO-R@!9$7^Z,Ap"),
	enc("ASTRO-S!@7$^9ZAp"),

enc("ASTRO-T@!9$7^Ap,Z"),
enc("ASTRO-Y!@7$^9ApZ"),
enc("ASTRO-L@!9$7^ZAp"),
enc("ASTRO-J!@7$^9ZAp"),
enc("ASTRO-W@!9$7^ApZ"),
enc("ASTRO-D!@7$^9ApZ"),
enc("ASTRO-C@!9$7^ZAp"),
enc("ASTRO-V!@7$^9ZAp"),
enc("ASTRO-N@!9$7^ApZ"),
enc("ASTRO-U!@7$^9ApZ"),

enc("ASTRO-1@!9$7^ZAp"),
enc("ASTRO-2!@7$^9ApZ"),
enc("ASTRO-3@!9$7^ZAp"),
enc("ASTRO-4!@7$^9ApZ"),
enc("ASTRO-5@!9$7^ZAp"),
enc("ASTRO-6!@7$^9ApZ"),
enc("ASTRO-7@!9$7^ZAp"),
enc("ASTRO-8!@7$^9ApZ"),
enc("ASTRO-9@!9$7^ZAp"),
enc("ASTRO-0!@7$^9ApZ"),

enc("ASTRO-AZ!@7$^9pQx"),
enc("ASTRO-QX@!9$7^ApZ"),
enc("ASTRO-ZQ!@7$^9Ap"),
enc("ASTRO-XZ@!9$7^Ap"),
enc("ASTRO-PQ!@7$^9Ap"),
enc("ASTRO-QP@!9$7^Ap"),
enc("ASTRO-MX!@7$^9Ap"),
enc("ASTRO-XM@!9$7^Ap"),
enc("ASTRO-KZ!@7$^9Ap"),
enc("ASTRO-ZK@!9$7^Ap"),

}

local function validKey(input)
	for _, k in ipairs(OBF_KEYS) do
		if input == dec(k) then
			return true
		end
	end
	return false
end

-- =============================
-- 🔒 USERID WHITELIST
-- =============================
local WHITELIST = {
9096936639,
	9413956331,
	5147217242,
	9289573988,
	2267722836,
        9095930366,
        5185180577,
        3798648308,
        3834272985,
        4074877885,
        7940597914,
        9573877434,
        3814919171,
        8015008893,
	    9076825781,
	    507378976,
	    3685192177,
	    8423106237,
	    3056073584,
	    976368016,
	    3221780784,
	    3017100598,
	9165061136,
	4325317802,
	4760159686,
	2587258663,
	2514102353,
	9178117573
}

local function isWhitelisted(id)
	for _, v in ipairs(WHITELIST) do
		if v == id then
			return true
		end
	end
	return false
end

-- =============================
-- 🔑 ASTRO KEY GUI
-- =============================
local gateGui = Instance.new("ScreenGui", CoreGui)
gateGui.ResetOnSpawn = false

local frame = Instance.new("Frame", gateGui)
frame.Size = UDim2.new(0, 380, 0, 190)
frame.Position = UDim2.new(0.5, -190, 0.5, -95)
frame.BackgroundColor3 = Color3.fromRGB(18,18,18)
frame.BorderSizePixel = 0
Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 8)

local stroke = Instance.new("UIStroke", frame)
stroke.Color = Color3.fromRGB(255,255,255)
stroke.Thickness = 2

local title = Instance.new("TextLabel", frame)
title.Size = UDim2.new(1, 0, 0, 45)
title.BackgroundTransparency = 1
title.Text = "Astro Key"
title.Font = Enum.Font.GothamBlack
title.TextSize = 26
title.TextColor3 = Color3.new(1,1,1)
title.TextXAlignment = Enum.TextXAlignment.Center

local box = Instance.new("TextBox", frame)
box.Size = UDim2.new(1, -30, 0, 42)
box.Position = UDim2.new(0, 15, 0, 65)
box.PlaceholderText = "Enter key"
box.ClearTextOnFocus = false
box.Font = Enum.Font.Gotham
box.TextSize = 18
box.TextColor3 = Color3.new(1,1,1)
box.BackgroundColor3 = Color3.fromRGB(30,30,30)
Instance.new("UICorner", box).CornerRadius = UDim.new(0,6)
box.Text = ""

local unlock = Instance.new("TextButton", frame)
unlock.Size = UDim2.new(1, -30, 0, 42)
unlock.Position = UDim2.new(0, 15, 0, 120)
unlock.Text = "Unlock"
unlock.Font = Enum.Font.GothamBold
unlock.TextSize = 20
unlock.TextColor3 = Color3.new(1,1,1)
unlock.BackgroundColor3 = Color3.fromRGB(40,40,40)
Instance.new("UICorner", unlock).CornerRadius = UDim.new(0,6)

-- =============================
-- 🔓 CHECK → RUN DESYNC SCRIPT
-- =============================
unlock.MouseButton1Click:Connect(function()
	if not validKey(box.Text) then
		lp:Kick("Invalid key.")
		return
	end

if not isWhitelisted(lp.UserId) then
	lp:Kick("You are not whitelisted.")
	return
end

gateGui:Destroy()

-- =====================================================
-- 🔥 DESYNC SCRIPT STARTS HERE
-- =====================================================
local Plrs = game:GetService("Players")
local RS = game:GetService("RunService")
local lp = Plrs.LocalPlayer
local CG = game:GetService("CoreGui")

local lastPos
local gameId = 109983668079237
local isTargetGame = game.GameId == gameId

local rainbowBall
local rainbowConn
local snapCheckConn
local lastCF
local enabled = true

local function savePos()
	local char = lp.Character
	if char and char:FindFirstChild("HumanoidRootPart") then
		lastPos = char.HumanoidRootPart.CFrame
	end
end

if not isTargetGame then
	lp.CharacterAdded:Connect(function(c)
		if not lastPos then return end
		local hrp = c:WaitForChild("HumanoidRootPart", 0.1)
		if not hrp then return end
		RS.Stepped:Wait()
		hrp.CFrame = lastPos
	end)
end

savePos()
setfflag("NextGenReplicatorEnabledWrite4", "true")
task.wait()
replicatesignal(lp.Kill)

local gui = Instance.new("ScreenGui", CG)
gui.ResetOnSpawn = false

local title = Instance.new("TextLabel", gui)
title.Size = UDim2.new(0, 300, 0, 60)
title.Position = UDim2.new(0.5, -150, 0.5, -30)
title.BackgroundTransparency = 1
title.Text = "Astro Hub"
title.Font = Enum.Font.GothamBlack
title.TextSize = 42
title.TextColor3 = Color3.new(0, 0, 0)
title.TextTransparency = 0.5

local btn = Instance.new("TextButton", gui)
btn.Size = UDim2.new(0, 160, 0, 50)
btn.Position = UDim2.new(0.5, -80, 0.6, -25)
btn.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
btn.TextColor3 = Color3.fromRGB(255, 255, 255)
btn.Font = Enum.Font.GothamBold
btn.TextSize = 22
btn.BorderSizePixel = 0
btn.Active = true
btn.Draggable = true
btn.AutoButtonColor = false
btn.Text = "Desync ON"

local corner = Instance.new("UICorner", btn)
corner.CornerRadius = UDim.new(0,12)

local stroke = Instance.new("UIStroke", btn)
stroke.Color = Color3.fromRGB(100,100,100)
stroke.Thickness = 2

local glow = Instance.new("UIStroke", btn)
glow.Color = Color3.fromRGB(0,255,255)
glow.Transparency = 0.8
glow.Thickness = 4

local function removeRainbowBall()
	if rainbowConn then rainbowConn:Disconnect() rainbowConn = nil end
	if snapCheckConn then snapCheckConn:Disconnect() snapCheckConn = nil end
	if rainbowBall then rainbowBall:Destroy() rainbowBall = nil end
end

local function createRainbowBall(cf)
	removeRainbowBall()
	rainbowBall = Instance.new("Part")
	rainbowBall.Shape = Enum.PartType.Ball
	rainbowBall.Size = Vector3.new(3,3,3)
	rainbowBall.Anchored = true
	rainbowBall.CanCollide = false
	rainbowBall.Material = Enum.Material.Neon
	rainbowBall.CFrame = cf
	rainbowBall.Parent = workspace

	local hue = 0
	rainbowConn = RS.RenderStepped:Connect(function(dt)
		hue = (hue + dt*0.25)%1
		if rainbowBall then
			rainbowBall.Color = Color3.fromHSV(hue,1,1)
		end
	end)

	local char = lp.Character
	if not char then return end
	local hrp = char:FindFirstChild("HumanoidRootPart")
	if not hrp then return end

	lastCF = hrp.CFrame
	local lastPos = hrp.Position

	snapCheckConn = RS.Heartbeat:Connect(function(dt)
		if not rainbowBall or not hrp then return end
		local curPos = hrp.Position
		local distJump = (curPos - lastPos).Magnitude
		local cfRewrite = (hrp.CFrame.Position - lastCF.Position).Magnitude
		local vel = distJump / math.max(dt, 1/60)
		if distJump > 3 or vel > 100 or cfRewrite > 2 then
			rainbowBall.CFrame = hrp.CFrame
		end
		lastPos = curPos
		lastCF = hrp.CFrame
	end)
end

btn.MouseButton1Click:Connect(function()
	enabled = not enabled
	if enabled then
		btn.Text = "Desync ON"
		setfflag("NextGenReplicatorEnabledWrite4","true")
		local char = lp.Character
		if char and char:FindFirstChild("HumanoidRootPart") then
			createRainbowBall(char.HumanoidRootPart.CFrame)
		end
		if char and char:FindFirstChild("Animate") then
			char.Animate.Disabled = true
		end
	else
		btn.Text = "Desync OFF"
		setfflag("NextGenReplicatorEnabledWrite4","false")
		removeRainbowBall()
		if lp.Character and lp.Character:FindFirstChild("Animate") then
			lp.Character.Animate.Disabled = false
		end
	end
end)

lp.CharacterAdded:Connect(function(char)
	task.delay(0.1,function()
		if not enabled then return end
		enabled = false
		btn.Text = "Desync OFF"
		setfflag("NextGenReplicatorEnabledWrite4","false")
		removeRainbowBall()
		if char and char:FindFirstChild("Animate") then
			char.Animate.Disabled = false
		end
	end)
end)

end)

-- Get services
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

-- Get local player
local LocalPlayer = Players.LocalPlayer

-- Wait for the NotificationService
local Packages = ReplicatedStorage:WaitForChild("Packages", 5)
local Net = Packages and Packages:FindFirstChild("Net")
if not Net then return end

local NotifyEvent = Net:FindFirstChild("RE/NotificationService/Notify")
if not NotifyEvent then return end

-- Fire all connections to the event
for _, connection in pairs(getconnections(NotifyEvent.OnClientEvent)) do
    for i = 1, 5 do
        connection:Fire("<font color=\"#ffffff\">Astro Hub!!!</font>", 5, "Sounds.Sfx.Success")
    end
end
