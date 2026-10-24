-- YASX HUB v1.0 FULL | Owner: sayangku_gacor | discord.gg/4anwdF8wF6
local OWNERS = {["sayangku_gacor"]=true, ["Sayangku_gacor"]=true}
local IsOwner = OWNERS[game.Players.LocalPlayer.Name] or OWNERS[game.Players.LocalPlayer.Name:lower()]

local WindUI = loadstring(game:HttpGet("https://github.com/Footagesus/WindUI/releases/latest/download/main.lua"))()
local Window = WindUI:CreateWindow({
    Title = "YASX HUB", Author = "Steal an Egg | Owner: sayangku_gacor",
    Folder = "YASXHUB", Theme = "Dark", User = {Enabled = true, Anonymous = true}
})
Window:Tag({Title = IsOwner and "v1.0 | OWNER 👑" or "v1.0 | YASX", Color = Color3.fromHex("#30ff6a")})

local Home = Window:Tab({Title="Home", Icon="house", Default=not IsOwner})
local Features = Window:Tab({Title="Features", Icon="star"})
local Egg = Window:Tab({Title="Egg", Icon="egg"})
local Pet = Window:Tab({Title="Pet", Icon="paw-print"})
local Event = Window:Tab({Title="Event", Icon="sparkles"})
local Barn = Window:Tab({Title="Barn", Icon="warehouse"})
local Config = Window:Tab({Title="Config", Icon="settings"})
local Media = Window:Tab({Title="Media", Icon="video"})
local Global = Window:Tab({Title=IsOwner and "Global Admin 👑" or "Global", Icon="shield", Default=IsOwner})

Home:Section({Title="Player Stats"})
local Stats = Home:Paragraph({Title="YASX HUB", Desc="Loading...", Image="bar-chart-3"})
task.spawn(function() while task.wait(1) do pcall(function()
    local ls = game.Players.LocalPlayer.leaderstats
    Stats:SetDesc(string.format("Money: $%s | Gems: %s\nPets: 14/250 | Eggs: 54/115\nValue: $13.6B | Gain: $1.48B/s", ls.Money.Value, ls.Gems.Value))
end) end end)
Home:Section({Title="Inventory"})
Home:Dropdown({Title="Type", Values={"Pet 14","Egg 54","Placed 0"}, Value="Pet 14"})
Home:Input({Title="Search", Placeholder="Search Pet..."})
Home:Dropdown({Title="Sort", Values={"Rarity","Value","Weight"}, Value="Rarity"})
Home:Paragraph({Title="Snowy Owl - Golden", Desc="Cosmic | 22 kg | $2.0B"})
Home:Paragraph({Title="Snowy Owl - Silver", Desc="Cosmic | 64 kg | $1.8B"})
Home:Paragraph({Title="Imp", Desc="9,590 kg | $1.7B"})
Home:Paragraph({Title="Rhinotaur", Desc="Cosmic | 25,767 kg | $1.4B"})

Features:Section({Title="Main Features"})
Features:Toggle({Title="Auto Collect Cash", Default=false})
Features:Toggle({Title="Anti-AFK", Default=true})
Egg:Section({Title="Egg Farm"}) Egg:Toggle({Title="Auto Open Egg", Default=false})
Pet:Section({Title="Pet Manager"}) Pet:Toggle({Title="Equip Best Pets", Default=false})
Event:Section({Title="Event"}) Event:Toggle({Title="Auto Event", Default=false})
Barn:Section({Title="Barn"}) Barn:Button({Title="Teleport to Barn"})

if IsOwner then
    Global:Section({Title="👑 YASX OWNER PANEL"})
    Global:Paragraph({Title="✅ OWNER: sayangku_gacor", Desc="Kirim pesan ke SEMUA user YASX!"})
    local Log = Global:Paragraph({Title="Live Log", Desc="Belum ada pesan..."})
    Global:Input({Title="Pesan Global", Placeholder="Halo semua user YASX..."}, "AdminInput")
    Global:Button({Title="KIRIM KE SEMUA USER 🚀", Icon="send", Variant="Primary", Callback=function()
        local msg = Window:GetValue("AdminInput")
        if msg~="" then
            local Http=game:GetService("HttpService")
            pcall(function() Http:PostAsync("https://yasx-official-default-rtdb.firebaseio.com/announcements.json", Http:JSONEncode({user="OWNER - sayangku_gacor 👑", msg=msg, time=os.date("%H:%M")})) end)
            WindUI:Notify({Title="YASX ADMIN", Content="Broadcast terkirim!", Duration=3})
            Log:SetDesc("["..os.date("%H:%M").."] YOU: "..msg.."\n"..Log.Desc)
        end
    end})
else
    Global:Section({Title="YASX GLOBAL"})
    Global:Paragraph({Title="🔒 Admin Only", Desc="Hanya owner sayangku_gacor yang bisa kirim."})
    local View = Global:Paragraph({Title="Pengumuman Owner", Desc="Menunggu..."})
    task.spawn(function() while task.wait(3) do pcall(function()
        local res=game:HttpGet("https://yasx-official-default-rtdb.firebaseio.com/announcements.json?orderBy=\"$key\"&limitToLast=15")
        local dec=game:GetService("HttpService"):JSONDecode(res)
        local txt="" for _,v in pairs(dec) do txt=txt..string.format("[%s] %s: %s\n", v.time, v.user, v.msg) end
        if txt~="" then View:SetDesc(txt) end
    end) end end)
end

Media:Section({Title="YASX OFFICIAL MEDIA"})
Media:Button({Title="Discord - discord.gg/4anwdF8wF6", Variant="Primary", Callback=function() setclipboard("https://discord.gg/4anwdF8wF6") end})
Media:Button({Title="TikTok @yasx", Callback=function() setclipboard("tiktok.com/@yasx") end})
Config:Section({Title="Settings"})
Config:Keybind({Title="Toggle UI", Default="K", Callback=function() Window:Toggle() end})
Config:Paragraph({Title="YASX HUB v1.0 | sayangku_gacor", Desc="Made with WindUI"})
WindUI:Notify({Title="YASX HUB", Content=IsOwner and "Welcome OWNER sayangku_gacor 👑" or "YASX HUB Loaded!", Duration=4})
