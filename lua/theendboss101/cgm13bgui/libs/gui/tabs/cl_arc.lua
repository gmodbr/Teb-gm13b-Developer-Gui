function C_GM13B_GUI_Panel:Fill_ARC_Tab(ARC_Tab)
  -- Tabs
  local PropertySheet = vgui.Create("DPropertySheet", ARC_Tab)
  PropertySheet:Dock(FILL)

  local ARC_SubTab_Main = vgui.Create("DPanel")
  ARC_SubTab_Main:SetBackgroundColor(Color(51, 51, 51))

  C_GM13B_GUI_Panel:Fill_ARC_SubTab_Main(ARC_SubTab_Main)

  PropertySheet:AddSheet( "Main", ARC_SubTab_Main, "icon16/user.png", false, false, "Main")
 end