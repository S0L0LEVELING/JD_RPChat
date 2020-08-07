AddEventHandler('chatMessage', function(source, args, rawCommand)
	prefix = Config.ServerPerms[1][2]
	color = Config.ServerPerms[1][1]
	for i = 1, #Config.ServerPerms do
		if IsPlayerAceAllowed(source, Config.ServerPerms[i][3]) then
			color = Config.ServerPerms[i][1]
			prefix = Config.ServerPerms[i][2]
		end
	end
	if string.sub(rawCommand,1,string.len("/"))=="/" then
		CancelEvent()
	else
		if Config.playerID then
			_id = source.." | "
		else
			_id = ""
		end
		TriggerClientEvent('chatMessage', -1, "^*^"..color.."".._id..""..prefix.." " .. GetPlayerName(source)..":^r^0 "..rawCommand, { 255, 255, 255 })
		CancelEvent()
	end
end)

RegisterCommand("me", function(source, args, rawCommand)
	if Config.playerID then
		_id = source.." | "
	else
		_id = ""
	end
	TriggerClientEvent('chatMessage', -1, "^*^"..Config.MePrefixColor.."".._id..""..Config.MePrefix.." " .. GetPlayerName(source)..":^r^0 "..rawCommand:gsub("me", ""), { 201, 201, 201 })
	exports.JD_logs:discord('[ME] **'.. GetPlayerName(source) .. '**:`' .. rawCommand:gsub("me ", "") .. '`', source, 0 , '10592673', 'chat')
end)

RegisterCommand("mer", function(source, args, rawCommand)
	if Config.playerID then
		_id = source.." | "
	else
		_id = ""
	end
	TriggerClientEvent('chatMessage', -1, "^*^"..Config.MerPrefixColor.."".._id..""..Config.MerPrefix.." " .. GetPlayerName(source)..":^r^0"..rawCommand:gsub("mer", ""), { 255, 0, 0 })
	exports.JD_logs:discord('[ME] **'.. GetPlayerName(source) .. '**:`' .. rawCommand:gsub("mer ", "") .. '`', source, 0 , '10592673', 'chat')
end)

RegisterCommand("twt", function(source, args, rawCommand)
	if Config.playerID then
		_id = source.." | "
	else
		_id = ""
	end
	TriggerClientEvent('chatMessage', -1, "^*^"..Config.TwtPrefixColor.."".._id..""..Config.TwtPrefix.." @" .. GetPlayerName(source)..":^r^0 "..rawCommand:gsub("twt", ""))
	exports.JD_logs:discord('[Twotter] **'.. GetPlayerName(source) .. '**:`' .. rawCommand:gsub("twt ", "") .. '`', source, 0 , '10592673', 'chat')
end)

RegisterCommand("discord", function(source, args, rawCommand)
	TriggerClientEvent('chatMessage', -1, "^*[Discord] ^r^0"..Config.DiscordLink, { 114, 137, 218 })
	exports.JD_logs:discord('**'.. GetPlayerName(source) .. '**:`' .. rawCommand .. '` https://discord.gg/feKymks', source, 0 , '10592673', 'chat')
end)

RegisterCommand("teamspeak", function(source, args, rawCommand)
	TriggerClientEvent('chatMessage', -1, "^*^3[TeamSpeak] ^r^0"..Config.TeamSpeakLink, { 28, 37, 55 })
	exports.JD_logs:discord('**'.. GetPlayerName(source) .. '**:`' .. rawCommand .. '` https://discord.gg/feKymks', source, 0 , '10592673', 'chat')
end)

RegisterCommand("website", function(source, args, rawCommand)
	TriggerClientEvent('chatMessage', -1, "^*^5[Website] ^r"..Config.WebsiteLink, { 28, 37, 55 })
	exports.JD_logs:discord('**'.. GetPlayerName(source) .. '**:`' .. rawCommand .. '` https://discord.gg/feKymks', source, 0 , '10592673', 'chat')
end)

RegisterCommand("ooc", function(source, args, rawCommand)
	if Config.playerID then
		_id = source.." | "
	else
		_id = ""
	end
	exports.JD_logs:discord('[OOC] **'.. GetPlayerName(source) .. '**:`' .. rawCommand:gsub("ooc ", "") .. '`', source, 0 , '10592673', 'chat')
	prefix = Config.ServerPerms[1][2]
	color = Config.ServerPerms[1][1]
	for i = 1, #Config.ServerPerms do
		if IsPlayerAceAllowed(source, Config.ServerPerms[i][3]) then
			color = Config.ServerPerms[i][1]
			prefix = Config.ServerPerms[i][2]
		end
	end
	TriggerClientEvent('chatMessage', -1, "^*^"..Config.OocPrefixColor.."".._id..""..Config.OocPrefix.." ^"..color..""..prefix.." " .. GetPlayerName(source)..":^r^0 "..rawCommand:gsub("ooc", ""), { 201, 201, 201 })
end)

function stringsplit(inputstr, sep)
    if sep == nil then
        sep = "%s"
    end
    local t={} ; i=1
    for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
        t[i] = str
        i = i + 1
    end
    return t
end

-- version check
Citizen.CreateThread(
	function()
		local vRaw = LoadResourceFile(GetCurrentResourceName(), 'version.json')
		if vRaw and Config.versionCheck then
			local v = json.decode(vRaw)
			PerformHttpRequest(
				'https://raw.githubusercontent.com/JokeDevil/JD_RPChat/master/version.json',
				function(code, res, headers)
					if code == 200 then
						local rv = json.decode(res)
						if rv.version ~= v.version then
							print(
								([[^1

-------------------------------------------------------
JD_RPChat
UPDATE: %s AVAILABLE
CHANGELOG: %s
-------------------------------------------------------
^0]]):format(
									rv.version,
									rv.changelog
								)
							)
						end
					else
						print('^JD_RPChat unable to check version^0')
					end
				end,
				'GET'
			)
		end
	end
)