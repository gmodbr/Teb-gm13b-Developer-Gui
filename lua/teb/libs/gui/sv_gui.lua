util.AddNetworkString("gm13_toggle_devmode")
util.AddNetworkString("gm13_event_memory_set")

local function toggledevsrv()
   GM13:ToggleDevMode()
   print("GM13 Dev Mode " .. (GM13.devMode and "On" or "Off"))
end

-- This could be done WAY Better, Nvm did it way better.

--[[net.Receive("gm13_event_memory_get", function()
   local RecMemory1 = net.ReadString()
   local RecMemory2 = net.ReadString()
   local RecMemory3 = net.ReadString()
   local RecMemory4 = net.ReadString()
   local RecMemory5 = net.ReadString()

   GM13.Event.Memory:Get(RecMemory1)
   GM13.Event.Memory:Get(RecMemory2)
   GM13.Event.Memory:Get(RecMemory3)
   GM13.Event.Memory:Get(RecMemory4)
   GM13.Event.Memory:Get(RecMemory5)
   print("Receved.")
end)--]]

net.Receive("gm13_event_memory_set", function()
   local RecMemory1 = net.ReadString()
   local RecMemory1a = net.ReadString()
   local RecMemory2 = net.ReadString()
   local RecMemory2a = net.ReadString()
   local RecMemory3 = net.ReadString()
   local RecMemory3a = net.ReadString()
   local RecMemory4 = net.ReadString()
   local RecMemory4a = net.ReadString()
   local RecMemory5 = net.ReadString()
   local RecMemory5a = net.ReadString()

   GM13.Event.Memory:Set(RecMemory1, RecMemory1a)
   GM13.Event.Memory:Set(RecMemory2, RecMemory2a)
   GM13.Event.Memory:Set(RecMemory3, RecMemory3a)
   GM13.Event.Memory:Set(RecMemory4, RecMemory4a)
   GM13.Event.Memory:Set(RecMemory5, RecMemory5a)
   print("Receved.")
end)

net.Receive("gm13_toggle_devmode", function(_, ply)
   if not ply:IsAdmin() and not ply:IsSuperAdmin() then return end

   toggledevsrv()
end)

concommand.Add("cgm13d_devmode",toggledevsrv)