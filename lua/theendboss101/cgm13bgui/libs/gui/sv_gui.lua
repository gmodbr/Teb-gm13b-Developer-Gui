util.AddNetworkString("gm13_toggle_devmode")
util.AddNetworkString("gm13_event_memory_set")
util.AddNetworkString("gm13_plr_setstatus")
util.AddNetworkString("gm13_start_mingebag_event")

-- This could be done WAY Better, Nvm did it way better.

net.Receive("gm13_plr_setstatus", function()
   local Health = net.ReadString()
   local Suit = net.ReadString()

   Entity(1):SetHealth(Health)
   Entity(1):SetSuitPower(Suit)
   print("Receved.")
end)

net.Receive("gm13_start_mingebag_event", function(_, ply)
   if not ply:IsAdmin() and not ply:IsSuperAdmin() then return end

   local isLocalMinge = net.ReadString()
   local delay = net.ReadString()
   local repetitions = net.ReadString()

   if isLocalMinge then
      GM13.Lobby:Join(delay, repetitions, nil, true)
   else
      GM13.Lobby:Exit()
      --CreateEvent()
      GM13.Lobby:SelectBestServer()
   end
   print("Receved.")
end)

net.Receive("gm13_event_memory_set", function(_, ply)
   if not ply:IsAdmin() and not ply:IsSuperAdmin() then return end
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

local function toggledevsrv()
   GM13:ToggleDevMode()
end

net.Receive("gm13_toggle_devmode", function(_, ply)
   if not ply:IsAdmin() and not ply:IsSuperAdmin() then return end

   toggledevsrv()
end)

concommand.Add("cgm13d_devmode",toggledevsrv)