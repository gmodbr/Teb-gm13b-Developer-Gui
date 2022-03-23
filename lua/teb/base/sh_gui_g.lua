if CLIENT then
   -- I have no idea what i am doing. - TheEndBoss_101
   function gm13b_DermaFrame()
	   --print("Community GM13Beta Debug Derma GUI Loading...")
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
         print("GM13.devMode",val)
      end
      
      -- Tier Slider
      local TierSlider = vgui.Create("DNumSlider", MainTab)
      TierSlider:SetPos(5,40)
      TierSlider:SetSize(150, 45)
      TierSlider:SetText("Edit Tier")
      TierSlider:SetMin(1)
      TierSlider:SetMax(4)
      TierSlider:SetDecimals(0)
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

      -- Cone
      local Memories_Cone_Button = vgui.Create("DButton" , MemoriesTab)
      Memories_Cone_Button:SetPos(5,30)
      Memories_Cone_Button:SetSize(100, 15)
      Memories_Cone_Button:SetText("Get Cone (savedCitizen)")
      Memories_Cone_Button:SizeToContents()
      Memories_Cone_Button.DoClick = function()
         net.Start("Cone_Memory")
         net.WriteString("Cone_Memory")
         net.SendToServer()
         game.CleanUpMap()
      end

      PropertySheet:AddSheet( "Main", MainTab, "icon16/group.png", false, false, "The main Property Sheet")
      PropertySheet:AddSheet( "Memories", MemoriesTab, "icon16/user.png", false, false, "Edit Memories")
      --print("Community GM13Beta Debug Derma GUI Loaded.")
   end

   -- bind "n" "cgm13d_vgui"
   concommand.Add("cgm13d_vgui",gm13b_DermaFrame)
end

if SERVER then
--   function Cone_Memory()
--      GM13.Event.Memory:Set("savedCitizen", true)
--   end
   -- Cone Memory
   util.AddNetworkString("Cone_Memory")
   local MsgNameReceived = function()
      local RecMemory = net.ReadString()
      --local RecWhatToDo = net.ReadString()
      if RecMemory == "Cone_Memory" then
         GM13.Event.Memory:Set("savedCitizen", true)
      end
	end
	net.Receive("Cone_Memory", MsgNameReceived)

end
