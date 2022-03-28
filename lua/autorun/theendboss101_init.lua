--[[
	Forked from:
	https://github.com/Xalalau/Anomaly-Research-Center-ARC

	Created by Xalalau(Og Addon) and TheEndBoss_101
	MIT License
]]

C_GM13B_GUI = { -- Community GM13 Developer
	Gui = {},
	--DevMode = false,
	ShowTools = false
}

hook.Add("Initialize", "theendboss101_C_GM13B_GUI_int", function()
	--GM13:AddBase("theendboss101/cgm13bgui") -- Legacy
	GM13:IncludeBase("theendboss101/cgm13bgui")
end)
