local Plugin = function(...)
	local Data = {...}
	
	local remoteEvent = Data[1][1]
	local remoteFunction = Data[1][2]
	local returnPermissions = Data[1][3]
	local Commands = Data[1][4]
	local Prefix = Data[1][5]
	local actionPrefix = Data[1][6]
	local returnPlayers = Data[1][7]
	local cleanData = Data[1][8]
	
	
	local pluginName = 'rank' -- Your Command Name (We've used "sa" for Staff Assistant, make sure it's lowercase and unique)
	local pluginPrefix = Prefix -- Prefix for your default prefix (usually ":"), actionPrefix for "!"
	local pluginLevel = 2 -- The level which can run the plugin, 0 = everyone, 1 = Moderator, 2 = Admin, 3 = Superadmin
	local pluginUsage = "<User(s)> <Rank>" -- Don't touch this unless you really need to
	local pluginDescription = "Promotes a user to the next rank." -- Don't touch this unless you really need to
	
	local token = "XXXXXXXXXXXXXXXXXXXXXXXXX" -- CHANGE THIS ⚠ - THIS IS YOUR TOKEN TAKEN FROM THE HYRA ADMIN - KEEP THIS SECURE 
	local groupId = 1 -- CHANGE THIS ⚠ - THIS IS YOUR GROUP ID
	
	local Ranking = require(4754168383) -- Require the module
	
	local function pluginFunction(Args) -- keep the name of the function as "pluginFunction"
		local Player = Args[1]
		if Args[3] then
			local Victims = returnPlayers(Player, Args[3]) if not Victims then return end
			
			local combinedVictims = ''
			for a,b in pairs(Victims) do
				if combinedVictims == '' then
					combinedVictims = b.Name
				else
					combinedVictims = combinedVictims..', '..b.Name
				end
			end
			
			for a,b in next,Victims do
				if Args[4] then
					if string.lower(Args[4]) == "sa" then
						local rankToRankTo = 35 -- CHANGE THIS ⚠ - THIS IS THE RANK YOU WANT TO PROMOTE THE USER TO
						local Callback = Ranking.SetRank(token, b.UserId, groupId, rankToRankTo)
						if Callback.Success == true then
							remoteEvent:FireClient(Player,'Hint','Success',b.Name..' was ranked.')
						else
							remoteEvent:FireClient(Player,'Hint','Error',b.Name..' was not ranked.')
						end
					elseif string.lower(Args[4]) == "trainee" then
						local rankToRankTo = 10 -- CHANGE THIS ⚠ - THIS IS THE RANK YOU WANT TO PROMOTE THE USER TO
						local Callback = Ranking.SetRank(token, b.UserId, groupId, rankToRankTo)
						if Callback.Success == true then
							remoteEvent:FireClient(Player,'Hint','Success',b.Name..' was ranked.')
						else
							remoteEvent:FireClient(Player,'Hint','Error',b.Name..' was not ranked.')
						end
					end
				end
			end
		end
	end
	
	-- Return Everything to the MainModule --
	local descToReturn
	if pluginUsage ~= "" then
		descToReturn = pluginPrefix..pluginName..' '..pluginUsage..'\n'..pluginDescription
	else
		descToReturn = pluginPrefix..pluginName..'\n'..pluginDescription
	end
	
	return pluginName,pluginFunction,pluginLevel,pluginPrefix,{pluginName,pluginUsage,pluginDescription}
end

return Plugin
