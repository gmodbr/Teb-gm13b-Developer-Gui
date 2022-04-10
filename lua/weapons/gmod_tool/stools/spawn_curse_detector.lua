TOOL.Category = "C_GM13B_GUI"
TOOL.Name = "#Tool.spawn_curse_detector.name"
TOOL.Command = nil
TOOL.ConfigName = ""
TOOL.Information = {
    { name = "left" },
}

if CLIENT then
	language.Add("Tool.spawn_curse_detector.name", "Curse Detector")
	language.Add("Tool.spawn_curse_detector.desc", "Spawns Curse Detector (gm13_sent_curse_detector)")
	language.Add("Tool.spawn_curse_detector.left", "Spawn Curse Detector")
end

local function spawn_curse_detector(pos)
	if SERVER then
		GM13.Event.Memory:Set("savedCitizen", true)
		local pos2 = Vector(math.Round(pos.x, 2), math.Round(pos.y, 2), math.Round(pos.z, 2))
		local spawn_curse_detector = ents.Create("gm13_sent_curse_detector")
		spawn_curse_detector:Spawn()
		spawn_curse_detector:SetPos(pos2 + Vector(0, 0, 20))
	end
end

function TOOL:LeftClick(trace)
	spawn_curse_detector(trace.HitPos)
	return true
end

function TOOL.BuildCPanel(pnl)
	pnl:AddControl("Header",{Text = "#Tool.spawn_curse_detector.name", Description = "#Tool.spawn_curse_detector.desc"})
end