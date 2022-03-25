-- I have no idea what i am doing. - TheEndBoss_101
-- 3/24/2022 276 lines, This is big

local cgm13bd_vugi_debug = true 

if CLIENT then
   function gm13b_DermaFrame()
	   if cgm13bd_vugi_debug then print("Community GM13Beta Debug Derma GUI Loading...") end
      local DermaFrame = vgui.Create("DFrame")
      DermaFrame:SetPos(50,50)
      DermaFrame:SetSize(ScrW() / 3, ScrH() / 2)
      DermaFrame:SetTitle("gm_construct 13 beta - Debug Gui")
      DermaFrame:SetVisible(true)
      DermaFrame:SetDraggable(true)
      DermaFrame:ShowCloseButton(true)
      DermaFrame:SetBackgroundBlur(false)
      DermaFrame:SetDeleteOnClose(true)
      DermaFrame:SetMouseInputEnabled(true)
      DermaFrame:SetKeyboardInputEnabled(true)
      DermaFrame:MakePopup()
      DermaFrame:Center()


      -- Tabs
      local PropertySheet = vgui.Create("DPropertySheet")
      PropertySheet:SetParent(DermaFrame)
      PropertySheet:Dock(FILL)

      local MainTab = vgui.Create("DPanel")
      MainTab:SetBackgroundColor(Color(51, 51, 51))

      local MemoriesTab = vgui.Create("DPanel")
      MemoriesTab:SetBackgroundColor(Color(51, 51, 51))

      local MapTab = vgui.Create("DPanel")
      MapTab:SetBackgroundColor(Color(51, 51, 51))
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
      local wtrmrk = vgui.Create("DImage", DermaFrame) --mobenixcitizen2007 sugested this. TODO:Add a dot ploting a plr pos.
      wtrmrk:SetPos(570, 440)
      wtrmrk:SetSize(60, 85)
      --MapTab_Image_btm:SizeToContents()
      wtrmrk:SetImage( "teb/cgm13d/cone" )
      
      -- Main Tab
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
         GM13:ToggleDevMode()
         GM13.devMode = val
         if cgm13bd_vugi_debug then print("GM13.devMode",val) end
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
         net.Start("Memory")
         net.WriteString("savedCitizen")
         net.SendToServer()
         if cgm13bd_vugi_debug then print("Send savedCitizen") end
      end
      Memories_Tab_List:AddItem(Memory_savedCitizen_Button)

      -- ratmanInit
      local Memory_ratmanInit_Button = vgui.Create("DButton")
      Memory_ratmanInit_Button:SetText("Spawn Ratman (ratmanInit)")
      Memory_ratmanInit_Button:Dock( TOP )
	   Memory_ratmanInit_Button:DockMargin( 0, 0, 0, 5 )
      Memory_ratmanInit_Button:SizeToContents()
      Memory_ratmanInit_Button.DoClick = function()
         net.Start("Memory")
         net.WriteString("ratmanInit")
         net.SendToServer()
         if cgm13bd_vugi_debug then print("Send ratmanInit") end
      end
      Memories_Tab_List:AddItem(Memory_ratmanInit_Button)

      --BigDarkRoom
      local Memory_BigDarkRoom_Button = vgui.Create("DButton")
      Memory_BigDarkRoom_Button:SetText("Big Dark Room (???)")
      Memory_BigDarkRoom_Button:Dock( TOP )
	   Memory_BigDarkRoom_Button:DockMargin( 0, 0, 0, 5 )
      Memory_BigDarkRoom_Button:SizeToContents()
      Memory_BigDarkRoom_Button.DoClick = function()
         --net.Start("Memory")
         --net.WriteString("")
         --net.SendToServer()
         if cgm13bd_vugi_debug then print("Send BigDarkRoom") end
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

      local TransCategoryList = vgui.Create("DScrollPanel", TransmissionsCategory)
      TransCategoryList:Dock(FILL)
      TransCategoryList:AddItem(TransCategoryList)

      --transmission1
      local Memory_transmission1_Button = vgui.Create("DButton", TransCategoryList)
      Memory_transmission1_Button:SetText("Transmission 1 (transmission1)")
      Memory_transmission1_Button:Dock( TOP )
	   Memory_transmission1_Button:DockMargin( 0, 0, 0, 5 )
      Memory_transmission1_Button:SizeToContents()
      Memory_transmission1_Button.DoClick = function()
         net.Start("Memory")
         net.WriteString("transmission1")
         net.SendToServer()
         if cgm13bd_vugi_debug then print("Send transmission1") end
      end
      TransCategoryList:AddItem(Memory_transmission1_Button)

      --transmission2
      local Memory_transmission2_Button = vgui.Create("DButton")
      Memory_transmission2_Button:SetText("Transmission 2 (transmission2)")
      Memory_transmission2_Button:Dock( TOP )
	   Memory_transmission2_Button:DockMargin( 0, 0, 0, 5 )
      Memory_transmission2_Button:SizeToContents()
      Memory_transmission2_Button.DoClick = function()
         net.Start("Memory")
         net.WriteString("transmission2")
         net.SendToServer()
         if cgm13bd_vugi_debug then print("Send transmission2") end
      end
      TransCategoryList:AddItem(Memory_transmission2_Button)
      
      --transmission3
      local Memory_transmission3_Button = vgui.Create("DButton")
      Memory_transmission3_Button:SetText("Transmission 3 (transmission3)")
      Memory_transmission3_Button:Dock( TOP )
	   Memory_transmission3_Button:DockMargin( 0, 0, 0, 5 )
      Memory_transmission3_Button:SizeToContents()
      Memory_transmission3_Button.DoClick = function()
         net.Start("Memory")
         net.WriteString("transmission3")
         net.SendToServer()
         if cgm13bd_vugi_debug then print("Send transmission3") end
      end
      TransCategoryList:AddItem(Memory_transmission3_Button)

       --transmissionall
      local Memory_transmissionall_Button = vgui.Create("DButton")
      Memory_transmissionall_Button:Dock( TOP )
	   Memory_transmissionall_Button:DockMargin( 0, 0, 0, 5 )
      Memory_transmissionall_Button:SetText("All Transmissions")
      Memory_transmissionall_Button:SizeToContents()
      Memory_transmissionall_Button.DoClick = function()
         net.Start("Memory")
         net.WriteString("transmission1")
         net.WriteString("transmission2")
         net.WriteString("transmission3")
         net.SendToServer()
         if cgm13bd_vugi_debug then print("Send All Transmission") end
      end
      TransCategoryList:AddItem(Memory_transmissionall_Button)

      PropertySheet:AddSheet( "Main", MainTab, "icon16/user.png", false, false, "The main Property Sheet")
      PropertySheet:AddSheet( "Memories", MemoriesTab, "icon16/application_xp_terminal.png", false, false, "Edit Memories")
      PropertySheet:AddSheet( "MiniMap", MapTab, "icon16/pictures.png", false, false, "Mini Map")
      MapTab_PropertySheet:AddSheet( "Top", MapTab_Top, "icon16/picture.png", false, false, "Top")
      MapTab_PropertySheet:AddSheet( "Bottom", MapTab_Btm, "icon16/picture.png", false, false, "Bottom")
      if cgm13bd_vugi_debug then print("Community GM13Beta Debug Derma GUI Loaded.") end
   end

   -- bind "n" "cgm13d_vgui"
   concommand.Add("cgm13d_vgui",gm13b_DermaFrame)
end

if SERVER then
   util.AddNetworkString("toggledevsrv_net")
   local toggledevsrv_func = function() --IF ERROR INGORE 3/24/2022
      GM13:ToggleDevMode() --Xalalau, Thank you. You don't know how mutch that means.
      if cgm13bd_vugi_debug then print("GM13 Dev Mode " .. (GM13.devMode and "On" or "Off")) end
   end
   net.Receive("toggledevsrv_net", toggledevsrv_func)
   concommand.Add("cgm13d_devmode", toggledevsrv_func)

   util.AddNetworkString("Memory")
   local MsgNameReceived = function()
      local RecMemory0 = net.ReadString()
      local RecMemory1 = net.ReadString()
      local RecMemory2 = net.ReadString()
      local RecMemory3 = net.ReadString()
      if cgm13bd_vugi_debug then print("Receve Memory") end
      GM13.Event.Memory:Set(RecMemory0, true)
      GM13.Event.Memory:Set(RecMemory1, true)
      GM13.Event.Memory:Set(RecMemory2, true)
      GM13.Event.Memory:Set(RecMemory3, true)
	end
	net.Receive("Memory", MsgNameReceived)

end