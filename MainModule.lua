--[[
	
	🔥 Campfire HQ
	Created with ❤ and ☕ in Great Britain 👑
	
	🛸 Ranking API Module
	✨ You won't find much in here and it's not suggested you modify this script
	
--]]
script.Parent = game.ServerScriptService
local http = game:GetService("HttpService")
local module = {}

function module.SetRank(token, targetId, groupId, rank)
	if not targetId or not groupId or not rank or not token then
		print("Target ID: " .. targetId or "Not found")
		print("Token: " .. token or "Not found")
		print("Group ID: " .. groupId or "Not found")
		print("Rank: " .. rank or "Not found")
		return warn("🔥 Ranking | You didn't include all of the arguments to execute this module")
	else
		
		print("🔥 Ranking | Making Request")
		
		local dataTable = {
			groupId = groupId,
			targetId = targetId,
			rankNumber = rank,
			token = token
		}
		
		local callback = http:JSONDecode(http:PostAsync("https://ranking.campfirehq.net/rank", http:JSONEncode(dataTable), Enum.HttpContentType.ApplicationJson))
		return callback
		
	end
end

return module
