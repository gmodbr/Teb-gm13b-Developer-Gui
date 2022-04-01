function C_GM13B_GUI_Panel:Fill_About_SubTab_License(About_SubTab_License)
  -- Setup
  local About_SubTab_License_List = vgui.Create("DScrollPanel", About_SubTab_License)
  About_SubTab_License_List:Dock(FILL)

  -- License p1
  local About_SubTab_License_License_Label_pt1 = vgui.Create("DLabel")
  About_SubTab_License_License_Label_pt1:SetText(" MIT License\n\nCopyright (c) 2022 TheEndBoss_101\n\nPermission is hereby granted, free of charge, to any person obtaining a copy of this software and associated \ndocumentation files (the \"Software\"), to deal in the Software without restriction, including without \nlimitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the \nSoftware, and to permit persons to whom the Software is furnished to do so, subject to the following \nconditions:\n\nThe above copyright notice and this permission notice shall be included in all copies or substantial portions \nof the Software.")
  About_SubTab_License_License_Label_pt1:SizeToContents()
  About_SubTab_License_License_Label_pt1:Dock(TOP)
  About_SubTab_License_License_Label_pt1:DockMargin(0, 0, 0, 5)
  About_SubTab_License_List:AddItem(About_SubTab_License_License_Label_pt1)

  -- License p2
  local About_SubTab_License_License_Label_pt2 = vgui.Create("DLabel")
  About_SubTab_License_License_Label_pt2:SetText(" THE SOFTWARE IS PROVIDED \"AS IS\", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT\n LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. \nIN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, \nWHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE\n SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.")
  About_SubTab_License_License_Label_pt2:SizeToContents()
  About_SubTab_License_License_Label_pt2:Dock(TOP)
  About_SubTab_License_License_Label_pt2:DockMargin(0, 0, 0, 5)
  About_SubTab_License_List:AddItem(About_SubTab_License_License_Label_pt2)
 end