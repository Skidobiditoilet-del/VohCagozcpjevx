-- =====================================================
-- 🔐 ASTRO HUB + RTX DESYNC V2 (FULL FFLAGS, MODERN GUI)
-- =====================================================
setfpscap(50)
local Players = game:GetService("Players")
local CoreGui = game:GetService("CoreGui")
local RunService = game:GetService("RunService")
local lp = Players.LocalPlayer
local fenv = getfenv()

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
-- 🔑 ASTRO KEYS
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
	enc("ASTRO-VX!@7$^9Ap"),
	enc("ASTRO-WY@!9$7^Ap"),
	enc("ASTRO-RZ!@7$^9Ap"),
	enc("ASTRO-SX@!9$7^Ap"),
	enc("ASTRO-TZ!@7$^9Ap"),
	enc("ASTRO-XY@!9$7^Ap"),
	enc("ASTRO-YZ!@7$^9Ap"),
	enc("ASTRO-LM@!9$7^Ap"),
	enc("ASTRO-JK!@7$^9Ap"),
	enc("ASTRO-AB@!9$7^Ap"),
	enc("ASTRO-CD!@7$^9Ap"),
	enc("ASTRO-EF!@9$7^Ap"),
}

local function validKey(input)
	for _, k in ipairs(OBF_KEYS) do
		if input == dec(k) then return true end
	end
	return false
end

-- =============================
-- 🔒 WHITELIST
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
	9178117573,
	1834293435,
}

local function isWhitelisted(id)
	for _, v in (WHITELIST) do
		if v == id then return true end
	end
	return false
end

-- =============================
-- 🔑 ASTRO KEY GUI
-- =============================
local gateGui = Instance.new("ScreenGui", CoreGui)
gateGui.ResetOnSpawn = false

local frameKey = Instance.new("Frame", gateGui)
frameKey.Size = UDim2.new(0, 380, 0, 190)
frameKey.Position = UDim2.new(0.5, -190, 0.5, -95)
frameKey.BackgroundColor3 = Color3.fromRGB(18,18,18)
frameKey.BorderSizePixel = 0
Instance.new("UICorner", frameKey).CornerRadius = UDim.new(0, 8)
Instance.new("UIStroke", frameKey).Color = Color3.new(1,1,1)
Instance.new("UIStroke", frameKey).Thickness = 2

local titleKey = Instance.new("TextLabel", frameKey)
titleKey.Size = UDim2.new(1,0,0,45)
titleKey.Position = UDim2.new(0,0,0,0)
titleKey.BackgroundTransparency = 1
titleKey.Text = "Astro Hub"
titleKey.Font = Enum.Font.GothamBlack
titleKey.TextSize = 26
titleKey.TextColor3 = Color3.new(0,255,255)
titleKey.TextXAlignment = Enum.TextXAlignment.Center

local box = Instance.new("TextBox", frameKey)
box.Size = UDim2.new(1,-30,0,42)
box.Position = UDim2.new(0,15,0,65)
box.PlaceholderText = "Enter key"
box.ClearTextOnFocus = false
box.Font = Enum.Font.Gotham
box.TextSize = 18
box.TextColor3 = Color3.new(1,1,1)
box.BackgroundColor3 = Color3.fromRGB(30,30,30)
Instance.new("UICorner", box).CornerRadius = UDim.new(0,6)
box.Text = ""

local unlock = Instance.new("TextButton", frameKey)
unlock.Size = UDim2.new(1,-30,0,42)
unlock.Position = UDim2.new(0,15,0,120)
unlock.Text = "Unlock"
unlock.Font = Enum.Font.GothamBold
unlock.TextSize = 20
unlock.TextColor3 = Color3.new(0,255,255)
unlock.BackgroundColor3 = Color3.fromRGB(40,40,40)
Instance.new("UICorner", unlock).CornerRadius = UDim.new(0,6)

-- =============================
-- 🔓 CHECK KEY & RUN DESYNC
-- =============================
unlock.MouseButton1Click:Connect(function()
	if not validKey(box.Text) then lp:Kick("Invalid key.") return end
	if not isWhitelisted(lp.UserId) then lp:Kick("You are not whitelisted.") return end

	gateGui:Destroy()

	-- =====================================================
	-- 🔥 RTX DESYNC V2 GUI
	-- =====================================================
	if CoreGui:FindFirstChild("RtxDesyncV2") then
		CoreGui.RtxDesyncV2:Destroy()
	end

	local screenGui = Instance.new("ScreenGui")
	screenGui.Name = "RtxDesyncV2"
	screenGui.Parent = CoreGui

	local frame = Instance.new("Frame")
	frame.Size = UDim2.new(0, 200, 0, 100)
	frame.Position = UDim2.new(0.78, 0, 0.55, 0)
	frame.BackgroundColor3 = Color3.fromRGB(20, 20, 25)
	frame.BorderSizePixel = 0
	frame.Active = true
	frame.Draggable = true
	frame.Parent = screenGui

	-- Gradient
	local gradient = Instance.new("UIGradient", frame)
	gradient.Color = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromRGB(25,25,35)), ColorSequenceKeypoint.new(1, Color3.fromRGB(40,40,50))})
	gradient.Rotation = 45

	-- Rounded corners
	local corner = Instance.new("UICorner")
	corner.CornerRadius = UDim.new(0,16)
	corner.Parent = frame

	-- Shadow effect
	local shadow = Instance.new("UIStroke")
	shadow.Thickness = 2
	shadow.Color = Color3.fromRGB(0,255,255)
	shadow.Transparency = 0.7
	shadow.Parent = frame

	-- Title
	local title = Instance.new("TextLabel")
	title.Parent = frame
	title.Size = UDim2.new(1,0,0,30)
	title.Position = UDim2.new(0,0,0,5)
	title.BackgroundTransparency = 1
	title.Text = "Astro Hub"
	title.Font = Enum.Font.GothamBold
	title.TextColor3 = Color3.fromRGB(0,255,255)
	title.TextSize = 20
	title.TextXAlignment = Enum.TextXAlignment.Center

	-- Desync Button
	local btnDesync = Instance.new("TextButton")
	btnDesync.Parent = frame
	btnDesync.Size = UDim2.new(0.9,0,0,35)
	btnDesync.Position = UDim2.new(0.05,0,0.55,0)
	btnDesync.BackgroundColor3 = Color3.fromRGB(0,0,0)
	btnDesync.BackgroundTransparency = 0.3
	btnDesync.Text = "Desync V2: OFF"
	btnDesync.Font = Enum.Font.GothamBold
	btnDesync.TextColor3 = Color3.fromRGB(0,255,255)
	btnDesync.TextSize = 18

	local btnGradient = Instance.new("UIGradient", btnDesync)
	btnGradient.Color = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromRGB(0,200,255)), ColorSequenceKeypoint.new(1, Color3.fromRGB(0,100,255))})
	btnGradient.Rotation = 45

	local btnCorner = Instance.new("UICorner")
	btnCorner.CornerRadius = UDim.new(0,12)
	btnCorner.Parent = btnDesync

	-- =============================
	-- FULL FFLAGS
	-- =============================
	local flags = {
	["GameNetPVHeaderRotationalVelocityZeroCutoffExponent"]="-5000",
	["LargeReplicatorWrite5"]="true",
	["LargeReplicatorEnabled9"]="true",
	["AngularVelociryLimit"]="360",
	["TimestepArbiterVelocityCriteriaThresholdTwoDt"]="2147483646",
	["S2PhysicsSenderRate"]="15000",
	["DisableDPIScale"]="true",
	["MaxDataPacketPerSend"]="2147483647",
	["ServerMaxBandwith"]="52",
	["PhysicsSenderMaxBandwidthBps"]="20000",
	["MaxTimestepMultiplierBuoyancy"]="2147483647",
	["SimOwnedNOUCountThresholdMillionth"]="2147483647",
	["MaxMissedWorldStepsRemembered"]="-2147483648",
	["CheckPVDifferencesForInterpolationMinVelThresholdStudsPerSecHundredth"]="1",
	["StreamJobNOUVolumeLengthCap"]="2147483647",
	["DebugSendDistInSteps"]="-2147483648",
	["MaxTimestepMultiplierAcceleration"]="2147483647",
	["LargeReplicatorRead5"]="true",
	["SimExplicitlyCappedTimestepMultiplier"]="2147483646",
	["GameNetDontSendRedundantNumTimes"]="1",
	["CheckPVLinearVelocityIntegrateVsDeltaPositionThresholdPercent"]="1",
	["CheckPVCachedRotVelThresholdPercent"]="10",
	["LargeReplicatorSerializeRead3"]="true",
	["ReplicationFocusNouExtentsSizeCutoffForPauseStuds"]="2147483647",
	["NextGenReplicatorEnabledWrite4"]="true",
	["CheckPVDifferencesForInterpolationMinRotVelThresholdRadsPerSecHundredth"]="1",
	["GameNetDontSendRedundantDeltaPositionMillionth"]="1",
	["InterpolationFrameVelocityThresholdMillionth"]="5",
	["StreamJobNOUVolumeCap"]="2147483647",
	["InterpolationFrameRotVelocityThresholdMillionth"]="5",
	["WorldStepMax"]="30",
	["TimestepArbiterHumanoidLinearVelThreshold"]="1",
	["InterpolationFramePositionThresholdMillionth"]="5",
	["TimestepArbiterHumanoidTurningVelThreshold"]="1",
	["MaxTimestepMultiplierContstraint"]="2147483647",
	["GameNetPVHeaderLinearVelocityZeroCutoffExponent"]="-5000",
	["CheckPVCachedVelThresholdPercent"]="10",
	["TimestepArbiterOmegaThou"]="1073741823",
	["MaxAcceptableUpdateDelay"]="1",
	["LargeReplicatorSerializeWrite4"]="true",
	}

	local defaultFlags = {}
	for name,_ in pairs(flags) do
		pcall(function() defaultFlags[name] = fenv.getfflag(name) end)
	end

	local desyncOn = false
	local firstUse = true

	local function applyFlags(toggle)
		if toggle then
			for name,value in pairs(flags) do
				pcall(function() fenv.setfflag(name,value) end)
			end
		else
			for name,value in pairs(defaultFlags) do
				pcall(function() fenv.setfflag(name,value) end)
			end
		end
	end

	btnDesync.MouseButton1Click:Connect(function()
		if desyncOn then
			desyncOn = false
			btnDesync.Text = "Desync V2: OFF"
			applyFlags(false)

game.Players.LocalPlayer.Character.Animate.Disabled = false

			return
		end

		desyncOn = true
		btnDesync.Text = "Desync V2: ON"
		applyFlags(true)

game.Players.LocalPlayer.Character.Animate.Disabled = true

		if firstUse then
			firstUse = false
			task.spawn(function()
				task.wait(0.3)
				pcall(function() fenv.replicatesignal(lp.Kill) end)
			end)
		end
	end)

	lp.CharacterAdded:Connect(function(char)
		-- normal toggle works after respawn
	end)
end)
