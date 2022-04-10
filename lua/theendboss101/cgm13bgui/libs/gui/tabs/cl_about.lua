function C_GM13B_GUI_Panel:Fill_About_Tab(About_Tab)
  -- Tabs
  local PropertySheet = vgui.Create("DPropertySheet", About_Tab)
  PropertySheet:Dock(FILL)

  local About_SubTab_Main = vgui.Create("DPanel")
  About_SubTab_Main:SetBackgroundColor(Color(51, 51, 51))
  local About_SubTab_License = vgui.Create("DPanel")
  About_SubTab_License:SetBackgroundColor(Color(51, 51, 51))

  C_GM13B_GUI_Panel:Fill_About_SubTab_Main(About_SubTab_Main)
  C_GM13B_GUI_Panel:Fill_About_SubTab_License(About_SubTab_License)

  PropertySheet:AddSheet( "Info", About_SubTab_Main, "icon16/information.png", false, false, "Main")
  PropertySheet:AddSheet( "License", About_SubTab_License, "icon16/key.png", false, false, "MIT License")
 end