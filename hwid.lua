local HWID = game:GetService("RbxAnalyticsService"):GetClientId()
local HWIDTABLE = loadstring(game:HttpGet("https://pastebin.com/raw/B86XdEEp"))()

for i, v in pairs(HWIDTABLE) do
if v == HWID then
    loadstring(game:HttpGet("https://pastebin.com/raw/yAR7WxLV"))()
    print('[.gg/shs] Welcome!')
    print('[.gg/shs] HWID: '..HWID)
else
    game.Players.LocalPlayer:Kick('UnWhitelisted HWID; '..HWID..'| .gg/shs')
end
end
