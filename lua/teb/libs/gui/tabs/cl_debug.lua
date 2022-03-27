function GM13Panel:FillDebugTab(DebugTab)
   --GM13:EnableDevMode()
   -- Desc
   local Debug_Tab_List = vgui.Create("DScrollPanel", DebugTab)
   Debug_Tab_List:Dock(FILL)
 
   local Debug_Tab_Label = vgui.Create("DLabel")
   Debug_Tab_Label:SetPos(5,5)
   Debug_Tab_Label:SetText(" The Debug Property Sheet: MUST HAVE DEV MODE ENABLED!")
   Debug_Tab_Label:SizeToContents()
   Debug_Tab_Label:Dock(TOP)
   Debug_Tab_Label:DockMargin(0, 0, 0, 5)
   Debug_Tab_List:AddItem(Debug_Tab_Label)
 
   -- Toggle gm13_events_render
   local gm13_events_render = vgui.Create("DCheckBoxLabel")
   gm13_events_render:SetText("gm13_events_render")
   gm13_events_render:SizeToContents()
   gm13_events_render:Dock(TOP)
   gm13_events_render:DockMargin(0, 0, 0, 5)
   if ConVarExists("gm13_events_render") then
      if GetConVar("gm13_events_render"):GetString() == "all" then
         gm13_events_render:SetValue(true)
      elseif GetConVar("gm13_events_render"):GetString() == "none" then
         gm13_events_render:SetValue(false)
      else
         gm13_events_render:SetValue(false)
      end
   end
   function gm13_events_render:OnChange(val)
      print(val)
      if val == true then
         RunConsoleCommand("gm13_events_render", "all")
      else
         RunConsoleCommand("gm13_events_render", "none")
      end
   end
   Debug_Tab_List:AddItem(gm13_events_render)

   -- Toggle gm13_events_show_names
   local gm13_events_show_names = vgui.Create("DCheckBoxLabel")
   gm13_events_show_names:SetText("gm13_events_show_names")
   gm13_events_show_names:SizeToContents()
   gm13_events_show_names:Dock(TOP)
   gm13_events_show_names:DockMargin(0, 0, 0, 5)
   if ConVarExists("gm13_events_render") then
      if GetConVar("gm13_events_render"):GetInt() == 1 then
         gm13_events_show_names:SetValue(true)
      elseif GetConVar("gm13_events_render"):GetInt() == 0 then
         gm13_evgm13_events_show_namesents_render:SetValue(false)
      else
         gm13_events_show_names:SetValue(false)
      end
   end
   function gm13_events_show_names:OnChange(val)
      print(val)
      if val == true then
         RunConsoleCommand("gm13_events_show_names", "1")
      else
         RunConsoleCommand("gm13_events_show_names", "0")
      end
   end
   Debug_Tab_List:AddItem(gm13_events_show_names)

   --EnableTesting
   local EnableTesting_Button = vgui.Create("DButton")
   EnableTesting_Button:SetText("Enable Testing")
   EnableTesting_Button:SetMouseInputEnabled(true)
   EnableTesting_Button.DoClick = function ()
      include("gm13/events/tier1/general/minge/sv_minge_g.lua")
      local isLocalMinge = false 
      local delay = 0.18
      local repetitions = 10
      if isLocalMinge then
         GM13.Lobby:Join(delay, repetitions, nil, true)
      else
         GM13.Lobby:Exit()
         CreateEvent()
         GM13.Lobby:SelectBestServer()
      end
   end
   EnableTesting_Button:Dock(TOP)
   EnableTesting_Button:DockMargin(0, 0, 0, 5)
   EnableTesting_Button:SizeToContents()
   Debug_Tab_List:AddItem(EnableTesting_Button)
 end