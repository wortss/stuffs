local Helpers = {}

function Helpers:GetPlayerByString(str)
	local found = false
	str = str:lower()
	local length = str:len()

	for _,v in pairs(game.Players:GetPlayers()) do
		if v.Name:sub(1, length):lower() == str then
			found = v
			break    
		end
	end

	for _,v in pairs(game.Players:GetPlayers()) do
		if v.DisplayName:sub(1, length):lower() == str then
			found = v
			break    
		end
	end

	return found
	
end


return Helpers
