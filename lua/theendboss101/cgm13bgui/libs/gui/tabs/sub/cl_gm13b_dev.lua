gm13_events_render_on = 0
gm13_events_show_names_on = 0

function C_GM13B_GUI_Panel:Fill_GM13B_SubTab_Dev(GM13B_SubTab_Dev)
  -- Setup
  local GM13B_SubTab_Dev_List = vgui.Create("DScrollPanel", GM13B_SubTab_Dev)
  GM13B_SubTab_Dev_List:Dock(FILL)

  -- Desc
  local GM13B_SubTab_Dev_Label = vgui.Create("DLabel")
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

   -- Start Event
   local Start_Event_Button = vgui.Create("DButton")
   Start_Event_Button:SetText("Start Mingebag Event")
   Start_Event_Button:SetMouseInputEnabled(true)
   Start_Event_Button.DoClick = function ()
      net.Start("gm13_start_mingebag_event")
      net.WriteString("false")
      net.WriteString("0.18")
      net.WriteString("10")
      net.SendToServer()
   end
   Start_Event_Button:Dock(TOP)
   Start_Event_Button:DockMargin(0, 0, 0, 5)
   Start_Event_Button:SizeToContents()
   GM13B_SubTab_Dev_List:AddItem(Start_Event_Button)
   -- Start Event2
   local Start_Event2_Button = vgui.Create("DButton")
   Start_Event2_Button:SetText("Start Local Mingebag Event")
   Start_Event2_Button:SetMouseInputEnabled(true)
   Start_Event2_Button.DoClick = function ()
      net.Start("gm13_start_mingebag_event")
      net.WriteString("true")
      net.WriteString("0.18")
      net.WriteString("10")
      net.SendToServer()
   end
   Start_Event2_Button:Dock(TOP)
   Start_Event2_Button:DockMargin(0, 0, 0, 5)
   Start_Event2_Button:SizeToContents()
   GM13B_SubTab_Dev_List:AddItem(Start_Event2_Button)

   -- Dev marker
   local GM13B_SubTab_Dev_Marker_Label = vgui.Create("DLabel")
   GM13B_SubTab_Dev_Marker_Label:SetText(" Memorys")
   GM13B_SubTab_Dev_Marker_Label:SizeToContents()
   GM13B_SubTab_Dev_Marker_Label:Dock(TOP)
   GM13B_SubTab_Dev_Marker_Label:DockMargin(0, 0, 0, 5)
   GM13B_SubTab_Dev_List:AddItem(GM13B_SubTab_Dev_Marker_Label)

   -- savedCitizen
   local Memory_savedCitizen_Button = vgui.Create("DButton")
   Memory_savedCitizen_Button:SetText("Get The Cone (savedCitizen)")
   Memory_savedCitizen_Button:Dock( TOP )
   Memory_savedCitizen_Button:DockMargin( 0, 0, 0, 5 )
   Memory_savedCitizen_Button:SizeToContents()
   Memory_savedCitizen_Button.DoClick = function()
      net.Start("gm13_event_memory_set")
      net.WriteString("savedCitizen")
      net.WriteString("true")
      net.SendToServer()
      print("Send savedCitizen")
   end
   GM13B_SubTab_Dev_List:AddItem(Memory_savedCitizen_Button)
 
   -- ratmanInit
   local Memory_ratmanInit_Button = vgui.Create("DButton")
   Memory_ratmanInit_Button:SetText("Spawn Ratman (ratmanInit)")
   Memory_ratmanInit_Button:Dock( TOP )
   Memory_ratmanInit_Button:DockMargin( 0, 0, 0, 5 )
   Memory_ratmanInit_Button:SizeToContents()
   Memory_ratmanInit_Button.DoClick = function()
      net.Start("gm13_event_memory_set")
      net.WriteString("ratmanInit")
      net.WriteString("true")
      net.SendToServer()
      print("Send ratmanInit")
   end
   GM13B_SubTab_Dev_List:AddItem(Memory_ratmanInit_Button)
 
   --BigDarkRoom
   local Memory_BigDarkRoom_Button = vgui.Create("DButton")
   Memory_BigDarkRoom_Button:SetText("Big Dark Room (???)")
   Memory_BigDarkRoom_Button:Dock( TOP )
   Memory_BigDarkRoom_Button:DockMargin( 0, 0, 0, 5 )
   Memory_BigDarkRoom_Button:SizeToContents()
   Memory_BigDarkRoom_Button.DoClick = function()
      --net.Start("gm13_event_memory_set")
      --net.WriteString("")
      --net.WriteString("true")
      --net.SendToServer()
      print("Send BigDarkRoom")
   end
   GM13B_SubTab_Dev_List:AddItem(Memory_BigDarkRoom_Button)
    
   -- Transmissions
   local TransmissionsCategory = vgui.Create("DCollapsibleCategory")
   TransmissionsCategory:SetLabel("Transmissions")
   TransmissionsCategory:SetExpanded(false)
   TransmissionsCategory:Dock( TOP )
   TransmissionsCategory:DockMargin( 0, 0, 0, 5 )
   TransmissionsCategory:SizeToContents()
   GM13B_SubTab_Dev_List:AddItem(TransmissionsCategory)
 
   local TransCategoryList = vgui.Create("DScrollPanel")
   TransCategoryList:Dock(FILL)
   TransmissionsCategory:SetContents(TransCategoryList)
 
   --transmission1
   local Memory_transmission1_Button = vgui.Create("DButton")
   Memory_transmission1_Button:SetText("Transmission 1 (transmission1)")
   Memory_transmission1_Button:Dock( TOP )
   Memory_transmission1_Button:DockMargin( 0, 0, 0, 5 )
   Memory_transmission1_Button:SizeToContents()
   Memory_transmission1_Button.DoClick = function()
      net.Start("gm13_event_memory_set")
      net.WriteString("transmission1")
      net.WriteString("true")
      net.SendToServer()
      print("Send transmission1")
   end
   TransCategoryList:AddItem(Memory_transmission1_Button)
 
   --transmission2
   local Memory_transmission2_Button = vgui.Create("DButton")
   Memory_transmission2_Button:SetText("Transmission 2 (transmission2)")
   Memory_transmission2_Button:Dock( TOP )
   Memory_transmission2_Button:DockMargin( 0, 0, 0, 5 )
   Memory_transmission2_Button:SizeToContents()
   Memory_transmission2_Button.DoClick = function()
      net.Start("gm13_event_memory_set")
      net.WriteString("transmission2")
      net.WriteString("true")
      net.SendToServer()
      print("Send transmission2")
   end
   TransCategoryList:AddItem(Memory_transmission2_Button)
    
   --transmission3
   local Memory_transmission3_Button = vgui.Create("DButton")
   Memory_transmission3_Button:SetText("Transmission 3 (transmission3)")
   Memory_transmission3_Button:Dock( TOP )
   Memory_transmission3_Button:DockMargin( 0, 0, 0, 5 )
   Memory_transmission3_Button:SizeToContents()
   Memory_transmission3_Button.DoClick = function()
      net.Start("gm13_event_memory_set")
      net.WriteString("transmission3")
      net.WriteString("true")
      net.SendToServer()
      print("Send transmission3")
   end
   TransCategoryList:AddItem(Memory_transmission3_Button)
 
   --transmission4
   local Memory_transmission4_Button = vgui.Create("DButton")
   Memory_transmission4_Button:SetText("Transmission 4 (transmission4)")
   Memory_transmission4_Button:Dock( TOP )
   Memory_transmission4_Button:DockMargin( 0, 0, 0, 5 )
   Memory_transmission4_Button:SizeToContents()
   Memory_transmission4_Button.DoClick = function()
      net.Start("gm13_event_memory_set")
      net.WriteString("transmission4")
      net.WriteString("true")
      net.SendToServer()
      print("Send transmission4")
   end
   TransCategoryList:AddItem(Memory_transmission4_Button)

   -- Dev marker
  local GM13B_SubTab_Dev_Marker_Label = vgui.Create("DLabel")
  GM13B_SubTab_Dev_Marker_Label:SetText(" EREVYTHING BELOW NEEDS DEVELOPER MODE ON LOOK ABOVE!")
  GM13B_SubTab_Dev_Marker_Label:SizeToContents()
  GM13B_SubTab_Dev_Marker_Label:Dock(TOP)
  GM13B_SubTab_Dev_Marker_Label:DockMargin(0, 0, 0, 5)
  GM13B_SubTab_Dev_List:AddItem(GM13B_SubTab_Dev_Marker_Label)

   -- Toggle gm13_events_render
   local gm13_events_render = vgui.Create("DCheckBoxLabel")
   gm13_events_render:SetText("Render areas of events.")
   gm13_events_render:SizeToContents()
   gm13_events_render:Dock(TOP)
   gm13_events_render:DockMargin(0, 0, 0, 5)
   if gm13_events_render_on == 1 then
      gm13_events_render:SetValue(true)
   else
      gm13_events_render:SetValue(false)
   end
   function gm13_events_render:OnChange(val)
      if val == true then
         RunConsoleCommand("gm13_events_render", "all")
         gm13_events_render_on = 1
      else
         RunConsoleCommand("gm13_events_render", "none")
         gm13_events_render_on = 0
      end
   end
   GM13B_SubTab_Dev_List:AddItem(gm13_events_render)

   -- Toggle gm13_events_show_names
   local gm13_events_show_names = vgui.Create("DCheckBoxLabel")
   gm13_events_show_names:SetText("Show the name of events at locations where they occur.")
   gm13_events_show_names:SizeToContents()
   gm13_events_show_names:Dock(TOP)
   gm13_events_show_names:DockMargin(0, 0, 0, 5)
   if gm13_events_show_names_on == 1 then
      gm13_events_show_names:SetValue(true)
   else
      gm13_events_show_names:SetValue(false)
   end
   function gm13_events_show_names:OnChange(val)
      if val == true then
         RunConsoleCommand("gm13_events_show_names", "1")
         gm13_events_show_names_on = 1
      else
         RunConsoleCommand("gm13_events_show_names", "0")
         gm13_events_show_names_on = 9
      end
   end
   GM13B_SubTab_Dev_List:AddItem(gm13_events_show_names)
 end
