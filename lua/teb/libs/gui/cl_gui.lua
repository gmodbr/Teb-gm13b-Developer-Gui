-- I have no idea what im doing. - TheEndBoss_101
-- you're doing some cool stuff - Xalalau

GM13Panel = {}

function GM13Panel:CreateWindow()
   print("Community GM13Beta Debug Derma GUI Loading...")

   math.randomseed(os.time())

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

   local arcTab = vgui.Create("DPanel")
   arcTab:SetBackgroundColor(Color(51, 51, 51))

   local MapTab = vgui.Create("DPanel")
   MapTab:SetBackgroundColor(Color(51, 51, 51))

   local DebugTab = vgui.Create("DPanel")
   DebugTab:SetBackgroundColor(Color(51, 51, 51))

   local wtrmrk = vgui.Create("DImageButton", DermaFrame) --mobenixcitizen2007 sugested this. TODO:Add a dot ploting a plr pos.
   wtrmrk:SetPos(570, 440)
   wtrmrk:SetSize(60, 85)
   --wtrmrk.DoClick = function()
	   --surface.PlaySound("lemon_rant.wav")
   --end
   local WtrmrkMath = math.random(1, 7) -- Has to be a better way
   if WtrmrkMath == 1 then
         wtrmrk:SetImage("teb/cgm13d/arc")
         wtrmrk:SetSize(65, 85)
      elseif WtrmrkMath == 2 then
         wtrmrk:SetImage("teb/cgm13d/blackfigure")
         wtrmrk.DoClick = function()
	         surface.PlaySound("teb/cgm13d/StillAlive.wav")
         end
      elseif WtrmrkMath == 3 then
         wtrmrk:SetImage("teb/cgm13d/coneoff")
      elseif WtrmrkMath == 4 then
         wtrmrk:SetImage("teb/cgm13d/coneon")
      elseif WtrmrkMath == 5 then
         wtrmrk:SetImage("teb/cgm13d/conered")
      elseif WtrmrkMath == 6 then
         wtrmrk:SetImage("teb/cgm13d/mingebag")
         wtrmrk.DoClick = function()
	         surface.PlaySound("teb/cgm13d/lemon_rant.wav")
         end
      elseif WtrmrkMath == 7 then
         wtrmrk:SetImage("teb/cgm13d/semper")
      else
         wtrmrk:SetImage("teb/cgm13d/semper_hat")
   end

   GM13Panel:FillMainTab(MainTab)
   GM13Panel:FillMapTab(MapTab)
   GM13Panel:FillMemoriesTab(MemoriesTab)
   GM13Panel:FillDebugTab(DebugTab)
   GM13Panel:FillarcTab(arcTab)

   PropertySheet:AddSheet( "Main", MainTab, "icon16/user.png", false, false, "The main Property Sheet")
   PropertySheet:AddSheet( "MiniMap", MapTab, "icon16/pictures.png", false, false, "Mini Map")
   PropertySheet:AddSheet( "Memories", MemoriesTab, "icon16/application_osx_terminal.png", false, false, "Edit Memories")
   PropertySheet:AddSheet( "Debug", DebugTab, "icon16/application_xp_terminal.png", false, false, "Edit ConCommands")
   PropertySheet:AddSheet( "A.R.C.", arcTab, "teb/cgm13d/arc16", false, false, "Anomaly Research Center")
end

-- bind "n" "cgm13d_vgui"
concommand.Add("cgm13d_vgui", GM13Panel.CreateWindow)
