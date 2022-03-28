function C_GM13B_GUI_Panel:Fill_GM13B_SubTab_Main(GM13B_SubTab_Main)
  -- Setup
  local GM13B_SubTab_Main_List = vgui.Create("DScrollPanel", GM13B_SubTab_Main)
  GM13B_SubTab_Main_List:Dock(FILL)

  -- Desc
  local GM13B_SubTab_Main_Label = vgui.Create("DLabel")
  GM13B_SubTab_Main_Label:SetPos(5,5)
  GM13B_SubTab_Main_Label:SetText(" The GM13B Main tab")
  GM13B_SubTab_Main_Label:SizeToContents()
  GM13B_SubTab_Main_Label:Dock(TOP)
  GM13B_SubTab_Main_Label:DockMargin(0, 0, 0, 5)
  GM13B_SubTab_Main_List:AddItem(GM13B_SubTab_Main_Label)
 
   -- Reset Button
   local Reset_Button = vgui.Create("DButton")
   Reset_Button:SetText("Reset The Addon")
   Reset_Button:SetConsoleCommand("gm13_reset", "yes")
   Reset_Button:Dock(TOP)
   Reset_Button:DockMargin(0, 0, 0, 5)
   Reset_Button:SizeToContents()
   GM13B_SubTab_Main_List:AddItem(Reset_Button)	

   -- 2796-1646-20
   local Button_2796_1646_20 = vgui.Create("DButton")
   Button_2796_1646_20:SetText("2796-1646-20")
   Button_2796_1646_20:SetConsoleCommand("2796-1646-20")
   Button_2796_1646_20:Dock(TOP)
   Button_2796_1646_20:DockMargin(0, 0, 0, 5)
   Button_2796_1646_20:SizeToContents()
   GM13B_SubTab_Main_List:AddItem(Button_2796_1646_20)
 end