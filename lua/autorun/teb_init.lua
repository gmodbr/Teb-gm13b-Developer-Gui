--[[
	Forked from:
	https://github.com/Xalalau/Anomaly-Research-Center-ARC

	Created by Xalalau(Og Addon) and the GMod Dev community, 2022 :)
	MIT License
]]

CGM13D = { -- Community GM13 Developer
	Gui = {}
}

hook.Add("Initialize", "teb_int", function()
	--GM13:AddBase("teb") -- Legacy
	GM13:IncludeBase("teb")
end)
