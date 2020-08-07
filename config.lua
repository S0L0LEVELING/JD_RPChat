Config = {}

Config.playerID = true

Config.JD_logs = false		-- Set to true if you're using my Discord to Logs resource ( https://github.com/JokeDevil/JD_logs )
Config.JD_Logs_color = "1752220"
Config.JD_Logs_channel = "chat"

Config.DiscordLink = 'https://discord.gg/m4BvmkG'
Config.TeamSpeakLink = 'ts.jokedevil.com'
Config.WebsiteLink = 'https://www.jokedevil.com'

Config.ServerPerms = {
{'0', '', ''}, -- Default Prefix
{'2', 'Trial Moderator |', 'jd.tmoderator'},
{'2', 'Moderator |', 'jd.moderator'},
{'1', 'Admin |', 'jd.admin'},
{'1', 'Owner |', 'jd.owner'},
{'1', 'Founder |', 'jd.founder'},
--{'COLOR', 'PREFIX', 'ACE_PERMISSION'},
}

Config.MePrefix = '[ME]'
Config.MerPrefix = '[ME]'
Config.OocPrefix = '[OOC]'
Config.TwtPrefix = '[Twotter]'

Config.MePrefixColor = '2'
Config.MerPrefixColor = '1'
Config.OocPrefixColor = '3'
Config.TwtPrefixColor = '5'

Config.Me3d = true
Config.Me3dScale = 0.5 										-- Text scale
Config.Me3dcolor = { r = 230, g = 230, b = 230, a = 255 } 	-- Text color
Config.Me3dfont = 0 										-- Text font
Config.Me3ddisplayTime = 5000 								-- Duration to display the text (in ms)
Config.Me3ddistToDraw = 250 								-- Min. distance to draw

-- for the perfix you need the Ace Permissions
-- EXAMPLE:  add_ace group.admin jd.admin allow


-- Version checker for when i update :)
Config.versionCheck = "1.0.0"
