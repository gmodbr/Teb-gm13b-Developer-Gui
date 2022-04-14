function C_GM13B_GUI_Panel:Fill_About_Tab(About_Tab)
  -- Tabs
  local PropertySheet = vgui.Create("DPropertySheet", About_Tab)
  PropertySheet:Dock(FILL)

  -- Water mark
  local WtrmrkTB = {
    ["1"] = {
      ["Name"] = "ARC",
      ["Size"] = "65, 85",
      ["Image"] = "theendboss101/cgm13bgui/arc",
      ["Sound"] = "theendboss101/cgm13bgui/arc",
    },
      ["2"] = {
      ["Name"] = "blackfigure",
      ["Size"] = "",
      ["Image"] = "theendboss101/cgm13bgui/blackfigure",
      ["Sound"] = "theendboss101/cgm13bgui/dialup.wav",
    },
      ["3"] = {
      ["Name"] = "coneoff",
      ["Size"] = "",
      ["Image"] = "theendboss101/cgm13bgui/coneoff",
      ["Sound"] = "",
    },
      ["4"] = {
      ["Name"] = "coneon",
      ["Size"] = "",
      ["Image"] = "theendboss101/cgm13bgui/coneon",
      ["Sound"] = "",
    },
      ["5"] = {
      ["Name"] = "conered",
      ["Size"] = "",
      ["Image"] = "theendboss101/cgm13bgui/conered",
      ["Sound"] = "",
    },
      ["6"] = {
      ["Name"] = "mingebag",
      ["Size"] = "",
      ["Image"] = "theendboss101/cgm13bgui/mingebag",
      ["Sound"] = "tetheendboss101b/cgm13bgui/lemon_rant.wav",
    },
      ["7"] = {
      ["Name"] = "semper",
      ["Size"] = "",
      ["Image"] = "theendboss101/cgm13bgui/semper",
      ["Sound"] = "",
    },
      ["8"] = {
      ["Name"] = "semper_hat",
      ["Size"] = "",
      ["Image"] = "theendboss101/cgm13bgui/semper_hat",
      ["Sound"] = "",
    },
  }

  local wtrmrk = vgui.Create("DImageButton", DermaFrame) --mobenixcitizen2007 sugested this.
  wtrmrk:SetSize(60, 85)
  wtrmrk:SetPos(570, 440)
  --wtrmrk:SetPos(60, 85)
  local wtrmrkMth = math.random(1, 8)
  local wtrmrkSel = WtrmrkTB[wtrmrkMth]
  wtrmrk:SetImage(wtrmrkSel["Image"])
  wtrmrk:SetSize(wtrmrkSel["Size"])
  wtrmrk.DoClick = function()
	  surface.PlaySound(wtrmrkSel["Sound"])
  end

  local About_SubTab_Main = vgui.Create("DPanel")
  About_SubTab_Main:SetBackgroundColor(Color(51, 51, 51))
  local About_SubTab_License = vgui.Create("DPanel")
  About_SubTab_License:SetBackgroundColor(Color(51, 51, 51))

  C_GM13B_GUI_Panel:Fill_About_SubTab_Main(About_SubTab_Main)
  C_GM13B_GUI_Panel:Fill_About_SubTab_License(About_SubTab_License)

  PropertySheet:AddSheet( "Info", About_SubTab_Main, "icon16/information.png", false, false, "Main")
  PropertySheet:AddSheet( "License", About_SubTab_License, "icon16/key.png", false, false, "MIT License")
 end