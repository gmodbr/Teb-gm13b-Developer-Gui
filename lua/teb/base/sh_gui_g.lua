local cgm13bd_vugi_debug = true 

if CLIENT then
   -- I have no idea what i am doing. - TheEndBoss_101
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
      --DermaFrame:SetTextColor(Color(50, 53, 59))
      DermaFrame:MakePopup()
      DermaFrame:Center()


      -- Tabs
      local PropertySheet = vgui.Create("DPropertySheet")
      PropertySheet:SetParent( DermaFrame )
      PropertySheet:Dock( FILL )

      local MainTab = vgui.Create( "DPanel" )
      --MainTab:SetParent( PropertySheet )
      MainTab:SetBackgroundColor(Color(51, 51, 51))

      local MemoriesTab = vgui.Create( "DPanel" )
      --MemoriesTab:SetParent( PropertySheet )
      MemoriesTab:SetBackgroundColor(Color(51, 51, 51))


      -- Main Tab
      -- Desc
      local MainTabLabel = vgui.Create( "DLabel", MainTab )
      MainTabLabel:SetPos(5,5)
      MainTabLabel:SetText("The main Property Sheet")
      MainTabLabel:SizeToContents()

      -- Toggle DevMode
      local Devmode = vgui.Create("DCheckBoxLabel", MainTab)
      Devmode:SetText("Developer Mode")
      Devmode:SetPos(5,25)
      Devmode:SizeToContents()
      if GM13.devMode then
         Devmode:SetValue(true)
      else
         Devmode:SetValue(false)
      end
      function Devmode:OnChange(val)
         GM13.devMode = val
         if cgm13bd_vugi_debug then print("GM13.devMode",val) end
      end
      
      -- Tier Slider
      local TierSlider = vgui.Create("DNumSlider", MainTab)
      TierSlider:SetPos(5,40)
      TierSlider:SetSize(150, 45)
      TierSlider:SetText("Edit Tier")
      TierSlider:SetMin(1)
      TierSlider:SetMax(4)
      TierSlider:SetDecimals(0)
      TierSlider:SetValue(gm13_tier)
      TierSlider:SetConVar("gm13_tier")
      TierSlider:SizeToContents()

      -- Reset Button
      local ResetButton = vgui.Create("DButton" , MainTab)
      ResetButton:SetPos(5,75)
      ResetButton:SetSize(100, 20)
      ResetButton:SetText("Reset The Addon")
      ResetButton:SetConsoleCommand("gm13_reset", "yes")
      ResetButton:SizeToContents()

      -- Memories Tab
      -- Desc
      local MemoriesTabLabel = vgui.Create( "DLabel", MemoriesTab )
      MemoriesTabLabel:SetPos(5,5)
      MemoriesTabLabel:SetText("Edit Memories")
      MemoriesTabLabel:SizeToContents()

      -- savedCitizen
      local Memory_savedCitizen_Button = vgui.Create("DButton" , MemoriesTab)
      Memory_savedCitizen_Button:SetPos(5,30)
      Memory_savedCitizen_Button:SetSize(100, 15)
      Memory_savedCitizen_Button:SetText("Get The Cone (savedCitizen)")
      Memory_savedCitizen_Button:SizeToContents()
      Memory_savedCitizen_Button.DoClick = function()
         net.Start("Memory")
         net.WriteString("savedCitizen")
         net.SendToServer()
         if cgm13bd_vugi_debug then print("Send savedCitizen") end
      end

       -- ratmanInit
      local Memory_ratmanInit_Button = vgui.Create("DButton" , MemoriesTab)
      Memory_ratmanInit_Button:SetPos(5,60)
      Memory_ratmanInit_Button:SetSize(100, 15)
      Memory_ratmanInit_Button:SetText("Spawn Ratman (ratmanInit)")
      Memory_ratmanInit_Button:SizeToContents()
      Memory_ratmanInit_Button.DoClick = function()
         net.Start("Memory")
         net.WriteString("ratmanInit")
         net.SendToServer()
         if cgm13bd_vugi_debug then print("Send ratmanInit") end
      end

      PropertySheet:AddSheet( "Main", MainTab, "icon16/group.png", false, false, "The main Property Sheet")
      PropertySheet:AddSheet( "Memories", MemoriesTab, "icon16/user.png", false, false, "Edit Memories")
      if cgm13bd_vugi_debug then print("Community GM13Beta Debug Derma GUI Loaded.") end
   end

   -- bind "n" "cgm13d_vgui"
   concommand.Add("cgm13d_vgui",gm13b_DermaFrame)
end

if SERVER then
   concommand.Add("cgm13d_devmode",enabledevsrv)
   function enabledevsrv()
      if GM13.devMode then
         GM13.devMode = 0
         if cgm13bd_vugi_debug then print("Server Dev Mode Off") end
      else
         GM13.devMode = 1
         if cgm13bd_vugi_debug then print("Server Dev Mode On") end
      end
   end

   util.AddNetworkString("Memory")
   local MsgNameReceived = function()
      local RecMemory = net.ReadString()
      if cgm13bd_vugi_debug then print("Receve Memory") end
      GM13.Event.Memory:Set(RecMemory, true)
	end
	net.Receive("Memory", MsgNameReceived)

end
