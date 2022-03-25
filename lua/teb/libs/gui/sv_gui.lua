util.AddNetworkString("gm13_set_memory")
util.AddNetworkString("gm13_toggle_devmode")

local function toggledevsrv()
   GM13:ToggleDevMode()
   print("GM13 Dev Mode " .. (GM13.devMode and "On" or "Off"))
end

net.Receive("gm13_set_memory", function()
   local RecMemory0 = net.ReadString()
   local RecMemory1 = net.ReadString()
   local RecMemory2 = net.ReadString()
   local RecMemory3 = net.ReadString()

   GM13.Event.Memory:Set(RecMemory0, true)
   GM13.Event.Memory:Set(RecMemory1, true)
   GM13.Event.Memory:Set(RecMemory2, true)
   GM13.Event.Memory:Set(RecMemory3, true)
end)

net.Receive("gm13_toggle_devmode", function(_, ply)
   if not ply:IsAdmin() and not ply:IsSuperAdmin() then return end

   toggledevsrv()
end)

concommand.Add("cgm13d_devmode",toggledevsrv)