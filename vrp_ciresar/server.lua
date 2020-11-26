local Proxy = module("vrp", "lib/Proxy")
local Tunnel = module("vrp", "lib/Tunnel")

vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP","vRP_ciresar")
vRPCciresar = Tunnel.getInterface("vRP_ciresar","vRP_ciresar")

vRPciresar = {}
Tunnel.bindInterface("vRP_ciresar",vRPciresar)
Proxy.addInterface("vRP_ciresar",vRPciresar)

function vRPciresar.verificacirese(cutie)
    local user_id = vRP.getUserId({source})
    local player = vRP.getUserSource({user_id})
    local bani = math.random(50,150)
    vRP.giveMoney({user_id,bani})
    vRPclient.notify(player,{"You've been rewarded with "..bani.." EURO"})
end


local function build_confisca(source)
	local user_id = vRP.getUserId({source})
    if user_id ~= nil then
        --vRPclient.addMarkerNames(source,{2553.8410644531,4668.697265625,33.987251281738+1.25, "~y~Nicu", 4, 1.2})
		--vRP.createNPC({source,"vRP:ciresor:ciresai","a_m_m_hillbilly_01",2553.8410644531,4668.697265625,33.987251281738-1, 20.9213104248,1,1.5,nil,nil})
		vRPclient.setNamedBlip(source, {"vRP:ciresar:ciresoi", 2553.8410644531,4668.697265625,33.987251281738, 384, 1, "~g~Cherries Farmer"})
	end
end

AddEventHandler("vRP:playerSpawn",function(user_id,source,first_spawn)
  if first_spawn then
    build_confisca(source)
  end
end)
