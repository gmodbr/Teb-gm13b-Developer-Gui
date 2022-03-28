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

   -- shuld remove.
   --[[] Water mark
   local wtrmrk = vgui.Create("DImageButton", DermaFrame) --mobenixcitizen2007 sugested this.
   wtrmrk:SetSize(60, 85)
   wtrmrk:SetPos(570, 440)
   --wtrmrk:SetPos(60, 85)
   local WtrmrkMath = math.random(1, 7) -- Has to be a better way
   if WtrmrkMath == 1 then
         wtrmrk:SetImage("theendboss101/cgm13bgui/arc")
         wtrmrk:SetSize(65, 85)
         wtrmrk.DoClick = function()
	         surface.PlaySound("theendboss101/cgm13bgui/StillAlive.wav")
         end
      elseif WtrmrkMath == 2 then
         wtrmrk:SetImage("theendboss101/cgm13bgui/blackfigure")
         wtrmrk.DoClick = function()
	         surface.PlaySound("theendboss101/cgm13bgui/dialup.wav")
         end
      elseif WtrmrkMath == 3 then
         wtrmrk:SetImage("theendboss101/cgm13bgui/coneoff")
      elseif WtrmrkMath == 4 then
         wtrmrk:SetImage("theendboss101/cgm13bgui/coneon")
      elseif WtrmrkMath == 5 then
         wtrmrk:SetImage("theendboss101/cgm13bgui/conered")
      elseif WtrmrkMath == 6 then
         wtrmrk:SetImage("theendboss101/cgm13bgui/mingebag")
         wtrmrk.DoClick = function()
	         surface.PlaySound("tetheendboss101b/cgm13bgui/lemon_rant.wav")
         end
      elseif WtrmrkMath == 7 then
         wtrmrk:SetImage("theendboss101/cgm13bgui/semper")
      else
         wtrmrk:SetImage("theendboss101/cgm13bgui/semper_hat")
   end--]]

    -- Tabs
   local PropertySheet = vgui.Create("DPropertySheet")
   PropertySheet:SetParent(DermaFrame)
   PropertySheet:Dock(FILL)

   local GM13B_Tab = vgui.Create("DPanel")
   GM13B_Tab:SetBackgroundColor(Color(51, 51, 51))
   local ARC_Tab = vgui.Create("DPanel")
   ARC_Tab:SetBackgroundColor(Color(51, 51, 51))

   C_GM13B_GUI_Panel:Fill_GM13B_Tab(GM13B_Tab)
   C_GM13B_GUI_Panel:Fill_ARC_Tab(ARC_Tab)

   PropertySheet:AddSheet("gm13b", GM13B_Tab, "icon16/application.png", false, false, "gm_construct 13 beta")
   PropertySheet:AddSheet("A.R.C.", ARC_Tab, "icon16/application_add.png", false, false, "Anomaly Research Center")
end

-- bind "n" "cgm13d_vgui"
concommand.Add("cgm13d_vgui", C_GM13B_GUI_Panel.CreateWindow)