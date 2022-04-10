function C_GM13B_GUI_Panel:Fill_ARC_SubTab_Main(ARC_SubTab_Main)
  -- Setup
  local ARC_SubTab_Main_List = vgui.Create("DScrollPanel", ARC_SubTab_Main)
  ARC_SubTab_Main_List:Dock(FILL)

  -- Desc
  local ARC_SubTab_Main_Label = vgui.Create("DLabel")
  ARC_SubTab_Main_Label:SetText(" The A.R.C. Main tab")
  ARC_SubTab_Main_Label:SizeToContents()
  ARC_SubTab_Main_Label:Dock(TOP)
  ARC_SubTab_Main_Label:DockMargin(0, 0, 0, 5)
  ARC_SubTab_Main_List:AddItem(ARC_SubTab_Main_Label)
 
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
  ARC_SubTab_Main_List:AddItem(ConeTierSlider)

  -- Set Health
   local Set_Health_Button = vgui.Create("DButton")
   Set_Health_Button:SetText("Set Health to 1")
   Set_Health_Button:SetMouseInputEnabled(true)
   Set_Health_Button.DoClick = function ()
      net.Start("gm13_plr_setstatus")
      net.WriteString("1")
      net.WriteString("0")
      net.SendToServer()
   end
   Set_Health_Button:Dock(TOP)
   Set_Health_Button:DockMargin(0, 0, 0, 5)
   Set_Health_Button:SizeToContents()
   ARC_SubTab_Main_List:AddItem(Set_Health_Button)
 end