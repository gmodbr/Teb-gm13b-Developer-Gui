TOOL.Category = "C_GM13B_GUI_DEV"
TOOL.Name = "#Tool.spawn_head.name"
TOOL.Command = nil
TOOL.ConfigName = ""
TOOL.Information = {
    { name = "left" },
}

if CLIENT then
	language.Add("Tool.spawn_head.name", "Spawn the skull")
	language.Add("Tool.spawn_head.desc", "Spawns the skull")
	language.Add("Tool.spawn_head.left", "Spawn obj")
end

local function spawn_head(pos)
	if SERVER then
		local pos2 = Vector(math.Round(pos.x, 2), math.Round(pos.y, 2), math.Round(pos.z, 2))
		local convertedProp = ents.Create("prop_physics")
		convertedProp:SetName("converted_prop_gm13_" .. "models/Gibs/HGIBS.mdl")
		convertedProp:SetNWBool("ritualprop", true)
		convertedProp:SetModel("models/Gibs/HGIBS.mdl")
		convertedProp:SetPos(pos2 + Vector(0,0,10))
		convertedProp:SetAngles(Angle(0,0,0))
		convertedProp.gm13_final_pos = Vector(2284.38, 3557.02, -100.69)
		convertedProp:Spawn()
		convertedProp:PhysicsInit(SOLID_VPHYSICS)
		convertedProp:SetMoveType(MOVETYPE_VPHYSICS)
		convertedProp:SetSolid(SOLID_VPHYSICS)
		local physObj = convertedProp:GetPhysicsObject()
		if IsValid(physObj) then
			physObj:Wake()
		end
		GM13.Ent:SetInvulnerable(convertedProp, true)
		GM13.Ent:BlockToolgun(convertedProp, true)
		GM13.Ent:BlockContextMenu(convertedProp, true)
	end
end

function TOOL:LeftClick(trace)
	spawn_head(trace.HitPos)
	return true
end

function TOOL.BuildCPanel(pnl)
	pnl:AddControl("Header",{Text = "#Tool.spawn_head.name", Description = "#Tool.spawn_head.desc"})
end