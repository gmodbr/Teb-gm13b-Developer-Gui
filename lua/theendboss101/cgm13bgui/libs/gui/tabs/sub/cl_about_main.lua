function C_GM13B_GUI_Panel:Fill_About_SubTab_Main(About_SubTab_Main)
  -- Setup
  local About_SubTab_Main_List = vgui.Create("DScrollPanel", About_SubTab_Main)
  About_SubTab_Main_List:Dock(FILL)

  -- Desc
  local About_SubTab_Main_Label = vgui.Create("DLabel")
  About_SubTab_Main_Label:SetText(" The information tab")
  About_SubTab_Main_Label:SizeToContents()
  About_SubTab_Main_Label:Dock(TOP)
  About_SubTab_Main_Label:DockMargin(0, 0, 0, 5)
  About_SubTab_Main_List:AddItem(About_SubTab_Main_Label)

  local About_SubTab_Main_Label = vgui.Create("DLabel")
  About_SubTab_Main_Label:SetText(" TheEndBoss_101's GM13B Derma GUI \n Ver: 3.5 \n By: TheEndBoss_101 (TEB) \n For: gm_construct_13 beta \n Last Edited: 4/1/2022")
  About_SubTab_Main_Label:SizeToContents()
  About_SubTab_Main_Label:Dock(TOP)
  About_SubTab_Main_Label:DockMargin(0, 0, 0, 5)
  About_SubTab_Main_List:AddItem(About_SubTab_Main_Label)
 end