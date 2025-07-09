-- ✅ โหลด GUI WindUI (RAW URL สำหรับ Delta)
local WindUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/Footagesus/WindUI/main/main.lua"))()

-- ✅ สร้างหน้าต่าง GUI
local Window = WindUI:CreateWindow({
    Title = "Anime Fruit Auto",
    Icon = "zap",
    Author = "By Poomipad Chaisanan",
    Size = UDim2.fromOffset(500, 400),
    Theme = "Dark",
})

Window:Notify("✅ โหลดสำเร็จ", "Anime Fruit GUI Loaded", 5)

-- ✅ Tabs
local Tabs = {
    MainTab = Window:Tab({ Title = "Auto", Icon = "swords" }),
}
Tabs.MainTab:Section({ Title = "Auto TP & Skill" })

-- ✅ Services
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local player = Players.LocalPlayer

-- ✅ หา HRP
local function getHumanoidRootPart()
    local char = player.Character or player.CharacterAdded:Wait()
    return char and char:FindFirstChild("HumanoidRootPart")
end

-- ✅ หา Enemy ที่ใกล้ที่สุด
local function getNearestEnemy()
    local root = getHumanoidRootPart()
    if not root then return nil end

    local closest, distance = nil, math.huge
    for _, v in ipairs(workspace:GetDescendants()) do
        if v:IsA("Model") and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v ~= player.Character then
            if v.Humanoid.Health > 0 then
                local d = (v.HumanoidRootPart.Position - root.Position).Magnitude
                if d < distance then
                    distance = d
                    closest = v
                end
            end
        end
    end
    return closest
end

-- ✅ โหลด Buffer & Remote
local buffer = getrenv().buffer or require(game:GetService("ReplicatedStorage"):WaitForChild("buffer"))
local remote = game:GetService("ReplicatedStorage"):WaitForChild("EventConfiguration"):WaitForChild("Your")

-- ✅ Skill Pack (ใส่เต็มจาก buffer จริงได้)
local skillArgs = {
    {
        buffer.fromstring("u"),
        buffer.fromstring("\254\a\000\006\0045098\006\00550981\006\004cast\v>\211\139\197\171?...")
    },
    {
        buffer.fromstring("u"),
        buffer.fromstring("\254\b\000\006\0045097\006\00550971\006\004cast\v\227a\139...")
    },
    -- เพิ่ม skill ได้ตามต้องการ
}

-- ✅ Auto TP + Skill ฟีเจอร์หลัก
local autoCombat = false
local combatConnection

Tabs.MainTab:Toggle({
    Title = "Auto TP + Skill",
    Icon = "target",
    Value = false,
    Callback = function(Value)
        autoCombat = Value

        if combatConnection then
            combatConnection:Disconnect()
            combatConnection = nil
        end

        if autoCombat then
            combatConnection = RunService.RenderStepped:Connect(function()
                local root = getHumanoidRootPart()
                if not root then return end

                local enemy = getNearestEnemy()
                if enemy and enemy:FindFirstChild("HumanoidRootPart") then
                    root.CFrame = enemy.HumanoidRootPart.CFrame * CFrame.new(0, 0, -5)

                    for _, skill in ipairs(skillArgs) do
                        pcall(function()
                            remote:FireServer(unpack(skill))
                        end)
                    end
                end
            end)
        else
            local root = getHumanoidRootPart()
            if root then root.Anchored = false end
        end
    end
})

-- ✅ ปุ่มทดสอบ
Tabs.MainTab:Button({
    Title = "Test Button",
    Icon = "check",
    Callback = function()
        Window:Notify("✅ ทดสอบสำเร็จ", "GUI ทำงานปกติ", 3)
    end
})
