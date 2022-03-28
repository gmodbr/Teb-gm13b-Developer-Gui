function C_GM13B_GUI_Panel:Fill_GM13B_SubTab_Dev(GM13B_SubTab_Dev)
  -- Setup
  local GM13B_SubTab_Dev_List = vgui.Create("DScrollPanel", GM13B_SubTab_Dev)
  GM13B_SubTab_Dev_List:Dock(FILL)

  -- Desc
  local GM13B_SubTab_Dev_Label = vgui.Create("DLabel")
  GM13B_SubTab_Dev_Label:SetPos(5,5)
  GM13B_SubTab_Dev_Label:SetText(" The GM13B Developer tab")
  GM13B_SubTab_Dev_Label:SizeToContents()
  GM13B_SubTab_Dev_Label:Dock(TOP)
  GM13B_SubTab_Dev_Label:DockMargin(0, 0, 0, 5)
  GM13B_SubTab_Dev_List:AddItem(GM13B_SubTab_Dev_Label)
 
  -- DevMode Toggle
  local Devmode_Toggle = vgui.Create("DCheckBoxLabel")
  Devmode_Toggle:SetText("Developer Mode")
  Devmode_Toggle:SizeToContents()
  Devmode_Toggle:Dock(TOP)
  Devmode_Toggle:DockMargin(0, 0, 0, 5)
  if GM13.devMode then
    Devmode_Toggle:SetValue(true)
  else
    Devmode_Toggle:SetValue(false)
  end
  function Devmode_Toggle:OnChange(val)
      net.Start("gm13_toggle_devmode")
      net.SendToServer()
  end
  GM13B_SubTab_Dev_List:AddItem(Devmode_Toggle)

  -- Tier Slider
   local TierSlider = vgui.Create("DNumSlider")
   TierSlider:SetText("Edit Tier")
   TierSlider:SetMin(1)
   TierSlider:SetMax(4)
   TierSlider:SetDecimals(0)
   TierSlider:SetValue(gm13_tier)
   TierSlider:SetConVar("gm13_tier")
   TierSlider:Dock(TOP)
   TierSlider:DockMargin(0, 0, 0, 5)
   TierSlider:SizeToContents()
   GM13B_SubTab_Dev_List:AddItem(TierSlider)

   -- Toggle gm13_events_render
   local gm13_events_render = vgui.Create("DCheckBoxLabel")
   gm13_events_render:SetText("Render areas of events.")
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
      if val == true then
         RunConsoleCommand("gm13_events_render", "all")
      else
         RunConsoleCommand("gm13_events_render", "none")
      end
   end
   GM13B_SubTab_Dev_List:AddItem(gm13_events_render)

   -- Toggle gm13_events_show_names
   local gm13_events_show_names = vgui.Create("DCheckBoxLabel")
   gm13_events_show_names:SetText("Show the name of events at locations where they occur.")
   gm13_events_show_names:SizeToContents()
   gm13_events_show_names:Dock(TOP)
   gm13_events_show_names:DockMargin(0, 0, 0, 5)
   if ConVarExists("gm13_events_show_names") then
      if GetConVar("gm13_events_show_names"):GetInt() == 1 then
         gm13_events_show_names:SetValue(true)
      elseif GetConVar("gm13_events_show_names"):GetInt() == 0 then
         gm13_events_show_names:SetValue(false)
      else
         gm13_events_show_names:SetValue(false)
      end
   end
   function gm13_events_show_names:OnChange(val)
      if val == true then
         RunConsoleCommand("gm13_events_show_names", "1")
      else
         RunConsoleCommand("gm13_events_show_names", "0")
      end
   end
   GM13B_SubTab_Dev_List:AddItem(gm13_events_show_names)
 end