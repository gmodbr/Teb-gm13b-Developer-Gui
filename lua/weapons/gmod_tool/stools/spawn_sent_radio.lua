TOOL.Category = "C_GM13B_GUI"
TOOL.Name = "#Tool.spawn_sent_radio.name"
TOOL.Command = nil
TOOL.ConfigName = ""
TOOL.Information = {
    { name = "left" },
}

if CLIENT then
	language.Add("Tool.spawn_sent_radio.name", "Ratman Radio")
	language.Add("Tool.spawn_sent_radio.desc", "Spawns Ratman Radio (gm13_sent_radio)")
	language.Add("Tool.spawn_sent_radio.left", "Spawn Ratman Radio")
end

local function spawn_sent_radio(pos)
	if SERVER then
		GM13.Event.Memory:Set("ratmanReady", true)
		local pos2 = Vector(math.Round(pos.x, 2), math.Round(pos.y, 2), math.Round(pos.z, 2))
		local spawn_sent_radio = ents.Create("gm13_sent_radio")
		spawn_sent_radio:Spawn()
		spawn_sent_radio:SetPos(pos2 + Vector(0, 0, 20))
	end
end

function TOOL:LeftClick(trace)
	spawn_sent_radio(trace.HitPos)
	return true
end

function TOOL.BuildCPanel(pnl)
	pnl:AddControl("Header",{Text = "#Tool.spawn_sent_radio.name", Description = "#Tool.spawn_sent_radio.desc"})
end