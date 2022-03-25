function GM13Panel:FillMainTab(MainTab)
    -- Main Tab
    -- Desc
    local Main_Tab_List = vgui.Create("DScrollPanel", MainTab)
    --Main_Tab_List:SetSpacing(5)
    --Main_Tab_List:EnableHorizontal(false)
    --Main_Tab_List:EnableVerticalScrollbar(true)
    --MainTab:SetContents(Main_Tab_List)
    Main_Tab_List:Dock(FILL)
    --Main_Tab_List:SetAutoSize(true)
    --Main_Tab_List:SizeToContents()
    --Main_Tab_List:AddItem()	
 
    local Main_Tab_Label = vgui.Create("DLabel")
    Main_Tab_Label:SetPos(5,5)
    Main_Tab_Label:SetText("The main Property Sheet")
    Main_Tab_Label:SizeToContents()
    Main_Tab_Label:Dock( TOP )
    Main_Tab_Label:DockMargin( 0, 0, 0, 5 )
    Main_Tab_List:AddItem(Main_Tab_Label)
 
    -- Toggle DevMode
    local Devmode = vgui.Create("DCheckBoxLabel")
    Devmode:SetText("Developer Mode")
    --Devmode:SetPos(5,25)
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
    --TierSlider:SetPos(5,40)
    --TierSlider:SetSize(150, 45)
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
    --ResetButton:SetPos(5,75)
    --ResetButton:SetSize(100, 20)
    ResetButton:SetText("Reset The Addon")
    ResetButton:SetConsoleCommand("gm13_reset", "yes")
    ResetButton:Dock( TOP )
    ResetButton:DockMargin( 0, 0, 0, 5 )
    ResetButton:SizeToContents()
    Main_Tab_List:AddItem(ResetButton)	
 end