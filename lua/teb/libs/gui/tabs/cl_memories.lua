function GM13Panel:FillMemoriesTab(MemoriesTab)
    -- Memories Tab
    -- Desc
    local Memories_Tab_List = vgui.Create("DScrollPanel", MemoriesTab)
    Memories_Tab_List:Dock(FILL)
 
    local Memories_Tab_Label = vgui.Create("DLabel")
    Memories_Tab_Label:SetText(" Add Memories")
    Memories_Tab_Label:Dock( TOP )
    Memories_Tab_Label:DockMargin( 0, 0, 0, 5 )
    Memories_Tab_Label:SizeToContents()
    Memories_Tab_List:AddItem(Memories_Tab_Label)
 
    -- savedCitizen
    local Memory_savedCitizen_Button = vgui.Create("DButton")
    Memory_savedCitizen_Button:SetText("Get The Cone (savedCitizen)")
    Memory_savedCitizen_Button:Dock( TOP )
    Memory_savedCitizen_Button:DockMargin( 0, 0, 0, 5 )
    Memory_savedCitizen_Button:SizeToContents()
    Memory_savedCitizen_Button.DoClick = function()
        net.Start("gm13_set_memory")
        net.WriteString("savedCitizen")
        net.SendToServer()
        print("Send savedCitizen")
    end
    Memories_Tab_List:AddItem(Memory_savedCitizen_Button)
 
    -- ratmanInit
    local Memory_ratmanInit_Button = vgui.Create("DButton")
    Memory_ratmanInit_Button:SetText("Spawn Ratman (ratmanInit)")
    Memory_ratmanInit_Button:Dock( TOP )
    Memory_ratmanInit_Button:DockMargin( 0, 0, 0, 5 )
    Memory_ratmanInit_Button:SizeToContents()
    Memory_ratmanInit_Button.DoClick = function()
        net.Start("gm13_set_memory")
        net.WriteString("ratmanInit")
        net.SendToServer()
        print("Send ratmanInit")
    end
    Memories_Tab_List:AddItem(Memory_ratmanInit_Button)
 
    --BigDarkRoom
    local Memory_BigDarkRoom_Button = vgui.Create("DButton")
    Memory_BigDarkRoom_Button:SetText("Big Dark Room (???)")
    Memory_BigDarkRoom_Button:Dock( TOP )
    Memory_BigDarkRoom_Button:DockMargin( 0, 0, 0, 5 )
    Memory_BigDarkRoom_Button:SizeToContents()
    Memory_BigDarkRoom_Button.DoClick = function()
        --net.Start("gm13_set_memory")
        --net.WriteString("")
        --net.SendToServer()
        print("Send BigDarkRoom")
    end
    Memories_Tab_List:AddItem(Memory_BigDarkRoom_Button)
    
    -- Transmissions
    local TransmissionsCategory = vgui.Create("DCollapsibleCategory")
    TransmissionsCategory:SetLabel("Transmissions")
    TransmissionsCategory:SetExpanded(false)
    TransmissionsCategory:Dock( TOP )
    TransmissionsCategory:DockMargin( 0, 0, 0, 5 )
    TransmissionsCategory:SizeToContents()
    Memories_Tab_List:AddItem(TransmissionsCategory)
 
    local TransCategoryList = vgui.Create("DScrollPanel")
    TransCategoryList:Dock(FILL)
    TransmissionsCategory:SetContents(TransCategoryList)
 
    --transmission1
    local Memory_transmission1_Button = vgui.Create("DButton")
    Memory_transmission1_Button:SetText("Transmission 1 (transmission1)")
    Memory_transmission1_Button:Dock( TOP )
    Memory_transmission1_Button:DockMargin( 0, 0, 0, 5 )
    Memory_transmission1_Button:SizeToContents()
    Memory_transmission1_Button.DoClick = function()
        net.Start("gm13_set_memory")
        net.WriteString("transmission1")
        net.SendToServer()
        print("Send transmission1")
    end
    TransCategoryList:AddItem(Memory_transmission1_Button)
 
    --transmission2
    local Memory_transmission2_Button = vgui.Create("DButton")
    Memory_transmission2_Button:SetText("Transmission 2 (transmission2)")
    Memory_transmission2_Button:Dock( TOP )
    Memory_transmission2_Button:DockMargin( 0, 0, 0, 5 )
    Memory_transmission2_Button:SizeToContents()
    Memory_transmission2_Button.DoClick = function()
        net.Start("gm13_set_memory")
        net.WriteString("transmission2")
        net.SendToServer()
        print("Send transmission2")
    end
    TransCategoryList:AddItem(Memory_transmission2_Button)
    
    --transmission3
    local Memory_transmission3_Button = vgui.Create("DButton")
    Memory_transmission3_Button:SetText("Transmission 3 (transmission3)")
    Memory_transmission3_Button:Dock( TOP )
    Memory_transmission3_Button:DockMargin( 0, 0, 0, 5 )
    Memory_transmission3_Button:SizeToContents()
    Memory_transmission3_Button.DoClick = function()
        net.Start("gm13_set_memory")
        net.WriteString("transmission3")
        net.SendToServer()
        print("Send transmission3")
    end
    TransCategoryList:AddItem(Memory_transmission3_Button)
 
    --transmissionall
    local Memory_transmissionall_Button = vgui.Create("DButton")
    Memory_transmissionall_Button:Dock( TOP )
    Memory_transmissionall_Button:DockMargin( 0, 0, 0, 5 )
    Memory_transmissionall_Button:SetText("All Transmissions")
    Memory_transmissionall_Button:SizeToContents()
    Memory_transmissionall_Button.DoClick = function()
        net.Start("gm13_set_memory")
        net.WriteString("transmission1")
        net.WriteString("transmission2")
        net.WriteString("transmission3")
        net.SendToServer()
        print("Send All Transmission")
    end
    TransCategoryList:AddItem(Memory_transmissionall_Button)
 end