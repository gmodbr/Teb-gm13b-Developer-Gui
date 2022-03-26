function GM13Panel:FillarcTab(arcTab)
   -- Desc
   local arc_Tab_List = vgui.Create("DScrollPanel", arcTab)
   arc_Tab_List:Dock(FILL)
 
   local arc_Tab_Label = vgui.Create("DLabel")
   arc_Tab_Label:SetPos(5,5)
   arc_Tab_Label:SetText(" The A.R.C. Property Sheet")
   arc_Tab_Label:SizeToContents()
   arc_Tab_Label:Dock( TOP )
   arc_Tab_Label:DockMargin( 0, 0, 0, 5 )
   arc_Tab_List:AddItem(arc_Tab_Label)
 
   -- Cone Tier Slider
   local ConeTierSlider = vgui.Create("DNumSlider")
   ConeTierSlider:SetText("Edit Tier")
   ConeTierSlider:SetMin(1)
   ConeTierSlider:SetMax(4)
   ConeTierSlider:SetDecimals(0)
   ConeTierSlider:SetValue(0)
   ConeTierSlider:Dock( TOP )
   ConeTierSlider:DockMargin( 0, 0, 0, 5 )
   ConeTierSlider:SizeToContents()
   arc_Tab_List:AddItem(ConeTierSlider)
 end