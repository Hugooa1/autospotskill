-- ✅ โหลด WindUI
local WindUI = loadstring(game:HttpGet("https://github.com/Footagesus/WindUI/releases/latest/download/main.lua"))()

-- ✅ สร้างหน้าต่าง
local Window = WindUI:CreateWindow({
    Title = "Anime Fruit",
    Icon = "zap",
    Author = "By Poomipad Chaisanan",
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
    MainTab = Window:Tab({ Title = "Main", Icon = "crown" }),
}

Tabs.MainTab:Section({ Title = "Auto Combat" })

-- ✅ Services
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local player = Players.LocalPlayer

-- ✅ ฟังก์ชันหา HRP
local function getHumanoidRootPart()
    local char = player.Character or player.CharacterAdded:Wait()
    return char:FindFirstChild("HumanoidRootPart")
end

-- ✅ หา Enemy ที่ใกล้ที่สุด
local function getNearestEnemy()
    local root = getHumanoidRootPart()
    if not root then return nil end

    local closestEnemy = nil
    local shortestDistance = math.huge

    for _, v in pairs(workspace:GetDescendants()) do
        if v:IsA("Model") and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") then
            if v ~= player.Character and v.Humanoid.Health > 0 then
                local dist = (v.HumanoidRootPart.Position - root.Position).Magnitude
                if dist < shortestDistance then
                    shortestDistance = dist
                    closestEnemy = v
                end
            end
        end
    end

    return closestEnemy
end

-- ✅ โหลด buffer & remote
local buffer = getrenv().buffer or require(game:GetService("ReplicatedStorage"):WaitForChild("buffer"))
local remote = game:GetService("ReplicatedStorage"):WaitForChild("EventConfiguration"):WaitForChild("Your")

-- ✅ Skill Pack (เดิมของคุณ)
local skillArgs = {
    { buffer.fromstring("u"), buffer.fromstring("...") },
    { buffer.fromstring("u"), buffer.fromstring("...") },
    -- 🔁 เพิ่มตามของจริงคุณทั้งหมด
}

-- ✅ เริ่มระบบ Auto TP + Skill
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
                    -- ✅ วาร์ปใกล้ศัตรู
                    local offset = Vector3.new(0, 0, -5)
                    root.CFrame = enemy.HumanoidRootPart.CFrame * CFrame.new(offset)

                    -- ✅ ยิงทุก Skill พร้อมกัน
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
