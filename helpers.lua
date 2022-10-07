local Helpers = {}

local Player = game.Players.LocalPlayer
local Character = Player.Character or Player.CharacterAdded:Wait()

Player.CharacterAdded:Connect(function(char)
	Character = char
end)

local TweenService = game:GetService("TweenService")

function Helpers:FindPlayerByString(str)
	if str == "me" then return Player end
	local found = false
	str = str:lower()
	local length = str:len()

	for _,plr in pairs(game.Players:GetPlayers()) do
		if plr.Name:sub(1, length):lower() == str then
			found = plr
			break
		end
	end
	
	if not found then
		
		for _,plr in pairs(game.Players:GetPlayers()) do
			if plr.DisplayName:sub(1, length):lower() == str then
				found = plr
				break
			end
		end
		
	end

	return found
	
end

function Helpers:SafelyTeleportMe(CF)
	
	local Dist = (CF.Position - Character:GetPivot().Position).Magnitude
	
	local TeleportTween = TweenService:Create(Character.HumanoidRootPart, TweenInfo.new(Dist / math.random(30,40)), {
		CFrame = CF
	})
	TeleportTween:Play()
	TeleportTween.Completed:Wait()
	TeleportTween:Destroy()
	return
end


return Helpers
