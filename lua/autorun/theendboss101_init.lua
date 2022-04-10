--[[
	Forked from:
	https://github.com/Xalalau/Anomaly-Research-Center-ARC

	Created by Xalalau(Og Addon) and TheEndBoss_101
	MIT License
]]

C_GM13B_GUI = { -- Community GM13 Developer
--CGM13 = { -- Community GM13
	name = "C_GM13B_GUI",
	Gui = {},
	--DevMode = false,
	toolCategories = { 
		"C_GM13B_GUI"
	},
}

--hook.Add("Initialize", CGM13.name .. "_int", function()
hook.Add("Initialize", C_GM13B_GUI.name .. "_int", function()
	--GM13:AddBase("theendboss101/cgm13bgui") -- Legacy
	GM13:IncludeBase("theendboss101/cgm13bgui")
end)
