function GM13Panel:FillMainTab(MainTab)
   -- Desc
   local Main_Tab_List = vgui.Create("DScrollPanel", MainTab)
   Main_Tab_List:Dock(FILL)
 
   local Main_Tab_Label = vgui.Create("DLabel")
   Main_Tab_Label:SetPos(5,5)
   Main_Tab_Label:SetText(" The main Property Sheet")
   Main_Tab_Label:SizeToContents()
   Main_Tab_Label:Dock( TOP )
   Main_Tab_Label:DockMargin( 0, 0, 0, 5 )
   Main_Tab_List:AddItem(Main_Tab_Label)
 
   -- Toggle DevMode
   local Devmode = vgui.Create("DCheckBoxLabel")
   Devmode:SetText("Developer Mode")
   Devmode:SizeToContents()
   Devmode:Dock( TOP )
   Devmode:DockMargin( 0, 0, 0, 5 )
   if GM13.devMode then
      Devmode:SetValue(true)
   else
      Devmode:SetValue(false)
   end
   function Devmode:OnChange(val)
       net.Start("gm13_toggle_devmode")
       net.SendToServer()
   end
   Main_Tab_List:AddItem(Devmode)	
 
   -- Tier Slider
   local TierSlider = vgui.Create("DNumSlider")
   TierSlider:SetText("Edit Tier")
   TierSlider:SetMin(1)
   TierSlider:SetMax(4)
   TierSlider:SetDecimals(0)
   TierSlider:SetValue(gm13_tier)
   TierSlider:SetConVar("gm13_tier")
   TierSlider:Dock( TOP )
   TierSlider:DockMargin( 0, 0, 0, 5 )
   TierSlider:SizeToContents()
   Main_Tab_List:AddItem(TierSlider)	
 
   -- Reset Button
   local ResetButton = vgui.Create("DButton")
   ResetButton:SetText("Reset The Addon")
   ResetButton:SetConsoleCommand("gm13_reset", "yes")
   ResetButton:Dock( TOP )
   ResetButton:DockMargin( 0, 0, 0, 5 )
   ResetButton:SizeToContents()
   Main_Tab_List:AddItem(ResetButton)	

   -- 2796-1646-20
   local Button_2796_1646_20 = vgui.Create("DButton")
   Button_2796_1646_20:SetText("2796-1646-20 ")
   Button_2796_1646_20:SetConsoleCommand("2796-1646-20 ")
   Button_2796_1646_20:Dock( TOP )
   Button_2796_1646_20:DockMargin( 0, 0, 0, 5 )
   Button_2796_1646_20:SizeToContents()
   Main_Tab_List:AddItem(Button_2796_1646_20)	
 end