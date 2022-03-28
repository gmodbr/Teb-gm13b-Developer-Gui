function C_GM13B_GUI_Panel:Fill_GM13B_SubTab_Map(GM13B_SubTab_Map)
  -- Setup
  local GM13B_SubTab_Map_PropertySheet = vgui.Create("DPropertySheet")
  GM13B_SubTab_Map_PropertySheet:SetParent(GM13B_SubTab_Map)
  GM13B_SubTab_Map_PropertySheet:Dock(FILL)

  local GM13B_SubTab_Map_Top = vgui.Create("DPanel")
  GM13B_SubTab_Map:SetBackgroundColor(Color(51, 51, 51))
  local GM13B_SubTab_Map_Btm = vgui.Create("DPanel")
  GM13B_SubTab_Map:SetBackgroundColor(Color(51, 51, 51))

  -- top
  GM13B_SubTab_Map_Image_top = vgui.Create("DImage", GM13B_SubTab_Map_Top)
  GM13B_SubTab_Map_Image_top:SetImage( "theendboss101/cgm13bgui/top" )
  GM13B_SubTab_Map_Image_top:SetPos(50, 5)
  GM13B_SubTab_Map_Image_top:SetSize(496, 396)

  -- Btm
  GM13B_SubTab_Map_Image_btm = vgui.Create("DImage", GM13B_SubTab_Map_Btm)
  GM13B_SubTab_Map_Image_btm:SetPos(100, 5)
  GM13B_SubTab_Map_Image_btm:SetSize(396, 396)
  GM13B_SubTab_Map_Image_btm:SetImage( "theendboss101/cgm13bgui/bottom" )

  GM13B_SubTab_Map_PropertySheet:AddSheet( "Top", GM13B_SubTab_Map_Top, "icon16/photo.png", false, false, "Top")
  GM13B_SubTab_Map_PropertySheet:AddSheet( "Bottom", GM13B_SubTab_Map_Btm, "icon16/photo.png", false, false, "Bottom")
 end