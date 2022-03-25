function GM13Panel:FillMapTab(MapTab)
    local MapTab_PropertySheet = vgui.Create("DPropertySheet")
    MapTab_PropertySheet:SetParent(MapTab)
    MapTab_PropertySheet:Dock(FILL)
 
    local MapTab_Top = vgui.Create("DPanel")
    MapTab:SetBackgroundColor(Color(51, 51, 51))
    local MapTab_Btm = vgui.Create("DPanel")
    MapTab:SetBackgroundColor(Color(51, 51, 51))
    -- Mini Map Tab
    -- top
    MapTab_Image_top = vgui.Create("DImage", MapTab_Top)
    MapTab_Image_top:SetImage( "teb/cgm13d/top" )
    MapTab_Image_top:SetPos(50, 5)
    MapTab_Image_top:SetSize(496, 396)
    --MapTab_Image_top:SizeToContents()
    -- Btm
    MapTab_Image_btm = vgui.Create("DImage", MapTab_Btm)
    MapTab_Image_btm:SetPos(100, 5)
    MapTab_Image_btm:SetSize(396, 396)
    MapTab_Image_btm:SetImage( "teb/cgm13d/bottom" )
    --MapTab_Image_btm:SizeToContents()

    MapTab_PropertySheet:AddSheet( "Top", MapTab_Top, "icon16/picture.png", false, false, "Top")
    MapTab_PropertySheet:AddSheet( "Bottom", MapTab_Btm, "icon16/picture.png", false, false, "Bottom")
end