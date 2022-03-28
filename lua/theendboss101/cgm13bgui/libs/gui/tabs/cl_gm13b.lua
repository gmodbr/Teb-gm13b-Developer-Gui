function C_GM13B_GUI_Panel:Fill_GM13B_Tab(GM13B_Tab)
  local PropertySheet = vgui.Create("DPropertySheet", GM13B_Tab)
  PropertySheet:Dock(FILL)

  local GM13B_SubTab_Main = vgui.Create("DPanel")
  GM13B_SubTab_Main:SetBackgroundColor(Color(51, 51, 51))
  local GM13B_SubTab_Map = vgui.Create("DPanel")
  GM13B_SubTab_Map:SetBackgroundColor(Color(51, 51, 51))
  local GM13B_SubTab_Dev = vgui.Create("DPanel")
  GM13B_SubTab_Dev:SetBackgroundColor(Color(51, 51, 51))

  C_GM13B_GUI_Panel:Fill_GM13B_SubTab_Main(GM13B_SubTab_Main)
  C_GM13B_GUI_Panel:Fill_GM13B_SubTab_Map(GM13B_SubTab_Map)
  C_GM13B_GUI_Panel:Fill_GM13B_SubTab_Dev(GM13B_SubTab_Dev)

  PropertySheet:AddSheet("Main", GM13B_SubTab_Main, "icon16/user.png", false, false, "Main")
  PropertySheet:AddSheet("Map", GM13B_SubTab_Map, "icon16/map.png", false, false, "Map")
  PropertySheet:AddSheet("Dev", GM13B_SubTab_Dev, "icon16/application_xp_terminal.png", false, false, "Developer")
 end