if CLIENT then
   -- I have no idea what i am doing. - TheEndBoss_101
   function frame_create()
      local DermaPanel = vgui.Create( "DFrame" )
      DermaPanel:SetPos( 50,50 )
      DermaPanel:SetSize( 200, 250 )
      DermaPanel:SetTitle( "gm_construct 13 beta Debug Gui" )
      DermaPanel:SetVisible(false)
      DermaPanel:SetDraggable(true)
      DermaPanel:ShowCloseButton(true)
      DermaPanel:SetBackgroundBlur(true)
      DermaPanel:MakePopup()
      
      -- Toggle DevMode
      local Devmode = vgui.Create( "DCheckBoxLabel", DermaPanel )
      Devmode:SetPos(10,50)
      Devmode:SetText("Developer Mode")
      --Devmode:SetConVar("sbox_godmode") -- TODO: Find a way i can change GM13.DevMode
      if GM13.DevMode then
         Devmode:SetValue(true)
      else
         Devmode:SetValue(false)
      end
      Devmode:SizeToContents()
      
      -- Tier Slider
      local TierSlider = vgui.Create( "DNumSlider", DermaPanel )
      TierSlider:SetPos(75,50)
      TierSlider:SetSize(150, 100)
      TierSlider:SetText("Edit Tier")
      TierSlider:SetMin(1)
      TierSlider:SetMax(4)
      TierSlider:SetDecimals(0)
      TierSlider:SetConVar("gm13_tier")
   end
   function frame_open()
      DermaPanel:SetVisible(true)
   end
   function frame_close()
      DermaPanel:SetVisible(false)
   end
   -- Commands
   concommand.Add("cgm13d_vgui_rebuild",frame_create)
   concommand.Add("cgm13d_vgui_close",frame_close)
   concommand.Add("cgm13d_vgui_open",frame_open)
   concommand.Add("-cgm13d_vgui",frame_close)
   concommand.Add("+cgm13d_vgui",frame_open)
   hook.Add("Initialize","init_cgm13d_vgui",frame_create)
end
