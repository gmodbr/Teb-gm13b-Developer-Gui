TOOL.Category = "gmc13b"
TOOL.Name = "#Tool.cone.name"
TOOL.Command = nil
TOOL.ConfigName = ""
TOOL.Information = {
    { name = "left" },
}

if CLIENT then
	language.Add("Tool.cone.name", "Curse Detector")
	language.Add("Tool.cone.desc", "Spawns Curse Detector (gm13_sent_curse_detector)")
	language.Add("Tool.cone.left", "Spawn Curse Detector")
end

local function spawn_curse_detector(pos)
	if SERVER then
		local spawn_curse_detector = ents.Create("gm13_sent_curse_detector")
		spawn_curse_detector:Spawn()
		spawn_curse_detector:SetPos(Vector(math.Round(pos.x, 2), math.Round(pos.y, 2), math.Round(pos.z, 2)))
	end
end

function TOOL:LeftClick(trace)
	spawn_curse_detector(trace.HitPos)
	return true
end

function TOOL.BuildCPanel(pnl)
	pnl:AddControl("Header",{Text = "#Tool.cone.name", Description = "#Tool.cone.desc"})
end