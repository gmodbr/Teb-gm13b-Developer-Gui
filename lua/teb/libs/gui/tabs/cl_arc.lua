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
  
  -- Cone Tier Slider -- gust straight up not working.
  local ConeTierSlider = vgui.Create("DNumSlider")
  ConeTierSlider:SetText("Edit Cone Tier")
  ConeTierSlider:SetMin(0)
  ConeTierSlider:SetMax(3)
  ConeTierSlider:SetDecimals(0)
  ConeTierSlider:SetValue(0)
  ConeTierSlider:Dock( TOP )
  ConeTierSlider:DockMargin( 0, 0, 0, 5 )
  ConeTierSlider:SizeToContents()
  ConeTierSlider.OnValueChanged = function(val) -- Easy, Yet Messy.
    if val == 0 then
      net.Start("gm13_event_memory_set")
      net.WriteString("coneLevel")
      net.WriteString("0")
      net.SendToServer()
      print("Send ConeLevel")
    elseif val == 1 then
      net.Start("gm13_event_memory_set")
      net.WriteString("coneLevel")
      net.WriteString("1")
      net.SendToServer()
      print("Send ConeLevel")
    elseif val == 2 then
      net.Start("gm13_event_memory_set")
      net.WriteString("coneLevel")
      net.WriteString("2")
      net.SendToServer()
      print("Send ConeLevel")
    elseif val == 3 then
      net.Start("gm13_event_memory_set")
      net.WriteString("coneLevel")
      net.WriteString("3")
      net.SendToServer()
      print("Send ConeLevel")
    end
  end
  arc_Tab_List:AddItem(ConeTierSlider)--]]
 end