-- I have no idea what im doing. - TheEndBoss_101 -- NOTE: I started on roblox, wasent my best idea.
-- you're doing some cool stuff - Xalalau

C_GM13B_GUI_Panel = {}

function C_GM13B_GUI_Panel:CreateWindow()
   --print("Hello, World")

   math.randomseed(os.time()) -- Random

   local DermaFrame = vgui.Create("DFrame")
   DermaFrame:SetPos(50, 50)
   DermaFrame:SetSize(ScrW() / 3, ScrH() / 2)
   DermaFrame:SetTitle("gm_construct 13 beta - Gui")
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

   local About_Tab = vgui.Create("DPanel")
   About_Tab:SetBackgroundColor(Color(51, 51, 51))
   local GM13B_Tab = vgui.Create("DPanel")
   GM13B_Tab:SetBackgroundColor(Color(51, 51, 51))
   local ARC_Tab = vgui.Create("DPanel")
   ARC_Tab:SetBackgroundColor(Color(51, 51, 51))

   C_GM13B_GUI_Panel:Fill_About_Tab(About_Tab)
   C_GM13B_GUI_Panel:Fill_GM13B_Tab(GM13B_Tab)
	C_GM13B_GUI_Panel:Fill_ARC_Tab(ARC_Tab)

   PropertySheet:AddSheet("About", About_Tab, "icon16/information.png", false, false, "Information")
   PropertySheet:AddSheet("gm13b", GM13B_Tab, "icon16/application.png", false, false, "gm_construct 13 beta")
--   if file.Exists("addons/Anomaly-Research-Center-ARC", "GAME" ) then
      PropertySheet:AddSheet("A.R.C.", ARC_Tab, "icon16/application_add.png", false, false, "Anomaly Research Center")
--   end
end

-- bind "n" "cgm13d_vgui"
concommand.Add("cgm13d_vgui", C_GM13B_GUI_Panel.CreateWindow)