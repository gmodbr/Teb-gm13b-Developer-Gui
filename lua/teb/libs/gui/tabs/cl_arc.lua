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
  ConeTierSlider:SetText("Edit Cone Tier")
  ConeTierSlider:SetMin(1)
  ConeTierSlider:SetMax(10)
  ConeTierSlider:SetDecimals(0)
	local conemem = GM13.Event.Memory:Get("coneLevel")
  if conemem == nil then
    ConeTierSlider:SetValue(0)
  else
    ConeTierSlider:SetValue(conemem)
  end
  ConeTierSlider:Dock( TOP )
  ConeTierSlider:DockMargin( 0, 0, 0, 5 )
  ConeTierSlider:SizeToContents()
  ConeTierSlider.OnValueChanged = function(self, val) -- causes a lot of lag.
    timer.Create("cgm13_memory_slider", 0.2, 1, function()
      net.Start("gm13_event_memory_set")
      net.WriteString("coneLevel")
      net.WriteString(tostring(val))
      net.SendToServer()
      print("Send ConeLevel: From: " .. tostring(GM13.Event.Memory:Get("coneLevel")) .. " To: " .. tostring(val))
      print(val)
    end)
  end
  arc_Tab_List:AddItem(ConeTierSlider)
 end