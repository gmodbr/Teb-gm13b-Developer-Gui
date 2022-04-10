TOOL.Category = "C_GM13B_GUI"
TOOL.Name = "#Tool.spawn_doll04.name"
TOOL.Command = nil
TOOL.ConfigName = ""
TOOL.Information = {
    { name = "left" },
}

if CLIENT then
	language.Add("Tool.spawn_doll04.name", "Spawn doll-04")
	language.Add("Tool.spawn_doll04.desc", "Spawns doll-04")
	language.Add("Tool.spawn_doll04.left", "Spawn obj")
end

local function spawn_doll04(pos)
	if SERVER then
		local pos2 = Vector(math.Round(pos.x, 2), math.Round(pos.y, 2), math.Round(pos.z, 2))
		local convertedProp = ents.Create("prop_physics")
		convertedProp:SetName("converted_prop_gm13_" .. "models/props_c17/doll01.mdl")
		convertedProp:SetNWBool("ritualprop", true)
		convertedProp:SetModel("models/props_c17/doll01.mdl")
		convertedProp:SetPos(pos2 + Vector(0,0,10))
		convertedProp:SetAngles(Angle(0,0,0))
		convertedProp.gm13_final_pos = Vector(2284.38, 3567.02, -120.69)
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
	spawn_doll04(trace.HitPos)
	return true
end

function TOOL.BuildCPanel(pnl)
	pnl:AddControl("Header",{Text = "#Tool.spawn_doll04.name", Description = "#Tool.spawn_doll04.desc"})
end