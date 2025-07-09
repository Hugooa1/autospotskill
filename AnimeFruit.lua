local WindUI = loadstring(game:HttpGet("https://github.com/Footagesus/WindUI/releases/latest/download/main.lua"))()

local Window = WindUI:CreateWindow({
    Title = "Anime Fruit",
    Icon = "door-open",
    Author = "By Poomipad Chaisanan. ",
    Size = UDim2.fromOffset(500, 400),
    Transparent = true,
    Theme = "Dark",
    SideBarWidth = 200,
    Background = "", 
    BackgroundImageTransparency = 0.42,
    HideSearchBar = true,
    ScrollBarEnabled = false,
    User = {
        Enabled = true,
        Anonymous = false,
        Callback = function() end,
    },
})

local Tabs = {
    MainTab = Window:Tab({ Title = "Main ", Icon = "crown"}), 
}

Tabs.MainTab:Section({
    Title = "Main"
})

local RunService = game:GetService("RunService")
local player = game.Players.LocalPlayer

local selectedLocation = "Wave #1"
local floatConnection

local positions = {
    ["Wave #1"] = Vector3.new(-4468.57, 6631.96, 368.50),
    ["Wave #2"] = Vector3.new(-4474.67, 6569.42, 380.77),
    ["Wave #3"] = Vector3.new(-4421.64, 6692.12, 714.89),
    ["Wave #4"] = Vector3.new(-4883.03, 6568.32, 602.04),
    ["Wave #5"] = Vector3.new(-4371.73, 7583.04, 380.89)
}

Tabs.MainTab:Dropdown({
    Title = "Select Wave",
    Values = {"Wave #1", "Wave #2", "Wave #3", "Wave #4", "Wave #5"},
    Default = "Wave #1",
    Callback = function(value)
        selectedLocation = value
    end
})

Tabs.MainTab:Toggle({
    Title = "TP",
    Icon = "arrow-up",
    Value = false,
    Callback = function(Value)
        if floatConnection then
            floatConnection:Disconnect()
            floatConnection = nil
        end

        local char = player.Character or player.CharacterAdded:Wait()
        local root = char and char:FindFirstChild("HumanoidRootPart")
        if not root then return end

        if Value then
            floatConnection = RunService.RenderStepped:Connect(function()
                local basePos = positions[selectedLocation]
                if basePos then
                    root.Anchored = true
                    root.CFrame = CFrame.new(basePos + Vector3.new(0, 30, 0))
                end
            end)
        else
            root.Anchored = false
        end
    end
})


local buffer = buffer or getrenv().buffer or require(game:GetService("ReplicatedStorage"):WaitForChild("buffer"))

local remote = game:GetService("ReplicatedStorage"):WaitForChild("EventConfiguration"):WaitForChild("Your")

local skillArgs = {
	{
		buffer.fromstring("u"),
		buffer.fromstring("\254\a\000\006\0045098\006\00550981\006\004cast\v>\211\139\197\171?\207E\244l\181C]\173y\191\005:\1962\181-b\190\131\r\1952\000\000\128?\134\000Y1\181-b>\f\005\005\177]\173y\191\t;\158\139\197\171?\207E\028\014\196C\001\000\001\005")
	},
	{
		buffer.fromstring("u"),
		buffer.fromstring("\254\b\000\006\0045097\006\00550971\006\004cast\v\227a\139\197\172?\207E\140\\\186CF\018\a?\001\017\1983swY?\222\014!2\000\000\128?\171\170\245\179swY\191\161\184\1463F\018\a?\t^\149\139\197\224%\207E\030\254\183C\001\000\001\000\006\004cast")
	},
	{
		buffer.fromstring("u"),
		buffer.fromstring("\254\b\000\006\0045097\006\00550971\006\004cast\v\024\222\139\197RK\205E\204\180\188C\195\255\127?\164\003\245\1764\2480\187Y\018\2360\000\000\128?J\255\206\1784\2480;\229\244\2062\195\255\127?\t\176\171\139\197\1351\205EM\242\191C\001\000\001\000\006\004cast")
	},
	{
		buffer.fromstring("u"),
		buffer.fromstring("\254\b\000\006\0045098\006\00550981\006\004cast\v\024\222\139\197RK\205E\204\180\188C\195\255\127?\164\003\245\1764\2480\187Y\018\2360\000\000\128?J\255\206\1784\2480;\229\244\2062\195\255\127?\tr\221\139\197RK\205E\208\180\173C\001\000\001\000\006\004cast")
	},
	{
		buffer.fromstring("u"),
		buffer.fromstring("\254\b\000\006\0045097\006\00550971\006\004cast\v\212\022\138\197\248 \209EQC2D\022\246\127?\218\211\n\175r|\142\188\027\1971\173\000\000\128?c\177\006\178r|\142<\241\172\0062\022\246\127?\t\216\234\137\197,\a\209E\132z3D\001\000\001\000\006\004cast")
	},
	{
		buffer.fromstring("u"),
		buffer.fromstring("\254\b\000\006\0045098\006\00550981\006\004cast\v\212\022\138\197\248 \209EQC2D\022\246\127?\218\211\n\175r|\142\188\020\1971\173\000\000\128?c\177\006\178r|\142<\241\172\0062\022\246\127?\t\167\018\138\197\248 \209E\155\195*D\001\000\001\000\006\004cast")
	},
	{
		buffer.fromstring("u"),
		buffer.fromstring("\254\b\000\006\0045097\006\00550971\006\004cast\v\252\144\152\197\139B\205E\017\160\021D\000\000\128?\000\000\000\000\000\000\000\000\000\000\000\000\000\000\128?\000\000\000\000\000\000\000\000\000\000\000\000\000\000\128?\t\171\211\152\197\192(\205E\221\220\021D\001\000\001\000\006\004cast")
	},
	{
		buffer.fromstring("u"),
		buffer.fromstring("\254\b\000\006\0045098\006\00550981\006\004cast\v\252\144\152\197\139B\205E\017\160\021D\000\000\128?\000\000\000\000\000\000\000\000\000\000\000\000\000\000\128?\000\000\000\000\000\000\000\000\000\000\000\000\000\000\128?\t\252\144\152\197\139B\205E\017 \014D\001\000\001\000\006\004cast")
	},
	{
		buffer.fromstring("u"),
		buffer.fromstring("\254\b\000\006\0045097\006\00550971\006\004cast\vg\187\141\197N\248\236Ev\133\191C\237\141Z?\"2+\179\215M\005?\177v\1643\000\000\128?\151\131R\179\215M\005\191\014\128\1753\237\141Z?\t\188\239\141\197\132\222\236E+\r\193C\001\000\001\000\006\004cast")
	},
	{
		buffer.fromstring("u"),
		buffer.fromstring("\254\b\000\006\0045098\006\00550981\006\004cast\vg\187\141\197N\248\236Ev\133\191C\237\141Z?\"2+\179\215M\005?\177v\1643\000\000\128?\151\131R\179\215M\005\191\014\128\1753\237\141Z?\t`8\142\197N\248\236E%\183\178C\001\000\001\000\006\004cast")
	}
}

local RunService = game:GetService("RunService")
local casting = false
local connection
local currentIndex = 1

Tabs.MainTab:Toggle({
	Title = "Auto Skill",
	Icon = "zap",
	Value = false,
	Callback = function(Value)
		casting = Value

		if connection then
			connection:Disconnect()
		end

		if casting then
			connection = RunService.RenderStepped:Connect(function()
				remote:FireServer(unpack(skillArgs[currentIndex]))
				currentIndex = currentIndex % #skillArgs + 1

-- ฟังก์ชันค้นหาศัตรูที่ใกล้ที่สุด
local function getNearestEnemy()
    local root = getHumanoidRootPart()
    if not root then return nil end

    local closestEnemy = nil
    local shortestDistance = math.huge

    for _, v in pairs(workspace:GetDescendants()) do
        if v:IsA("Model") and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") then
            if v ~= player.Character and v.Humanoid.Health > 0 then
                local distance = (v.HumanoidRootPart.Position - root.Position).Magnitude
                if distance < shortestDistance then
                    shortestDistance = distance
                    closestEnemy = v
                end
            end
        end
    end

    return closestEnemy
end

-- Toggle สำหรับ Auto TP
Tabs.MainTab:Toggle({
    Title = "Auto TP to Enemy",
    Icon = "crosshair",
    Value = false,
    Callback = function(Value)
        autoTP = Value

        if tpConnection then
            tpConnection:Disconnect()
            tpConnection = nil
        end

        if autoTP then
            tpConnection = RunService.RenderStepped:Connect(function()
                local root = getHumanoidRootPart()
                if not root then return end

                local enemy = getNearestEnemy()
                if enemy and enemy:FindFirstChild("HumanoidRootPart") then
                    local offset = Vector3.new(0, 0, -5) -- อยู่ห่างจากศัตรู 5 studs
                    root.CFrame = enemy.HumanoidRootPart.CFrame * CFrame.new(offset)
                end
            end)
        else
            -- หยุดวาร์ป
            if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                player.Character.HumanoidRootPart.Anchored = false
			end)
		end
	end
})
