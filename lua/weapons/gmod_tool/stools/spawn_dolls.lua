TOOL.Category = "gmc13b"
TOOL.Name = "#Tool.spawn_dolls.name"
TOOL.Command = nil
TOOL.ConfigName = ""
TOOL.Information = {
    { name = "left" },
	{ name = "right" },
}

numb = 1

if CLIENT then
	language.Add("Tool.spawn_dolls.name", "WIP - Spawn dolls")
	language.Add("Tool.spawn_dolls.desc", "Spawns dolls")
	language.Add("Tool.spawn_dolls.left", "Spawn obj")
	language.Add("Tool.spawn_dolls.right", "Change what to spawn, current type: 1")
	if numb == 1 then
		language.Add("Tool.spawn_dolls.right", "Change what to spawn, current type: 1")
	elseif numb == 2 then
		language.Add("Tool.spawn_dolls.right", "Change what to spawn, current type: 2")
	elseif numb == 3 then
		language.Add("Tool.spawn_dolls.right", "Change what to spawn, current type: 3")
	elseif numb == 4 then
		language.Add("Tool.spawn_dolls.right", "Change what to spawn, current type: 4")
	elseif numb == 5 then
		language.Add("Tool.spawn_dolls.right", "Change what to spawn, current type: 5")
	end
end

local function spawn_dolls(pos, type)
	if SERVER then
		local pos2 = Vector(math.Round(pos.x, 2), math.Round(pos.y, 2), math.Round(pos.z, 2))
		local convertedProp = ents.Create("prop_physics")
		convertedProp:SetName("converted_prop_gm13_" .. "models/props_c17/doll01.mdl")
		convertedProp:SetNWBool("ritualprop", true)
		convertedProp:SetModel("models/props_c17/doll01.mdl")
		convertedProp:SetPos(pos2 + Vector(0,0,10))
		convertedProp:SetAngles(Angle(0,0,0))
		if numb == 1 then
			convertedProp.gm13_final_pos = Vector(2284.38, 3557.02, -120.69)
		elseif numb == 2 then
			convertedProp.gm13_final_pos = Vector(2284.38, 3547.02, -120.69)
		elseif numb == 3 then
			convertedProp.gm13_final_pos = Vector(2284.38, 3537.02, -120.69)
		elseif numb == 4 then
			convertedProp.gm13_final_pos = Vector(2284.38, 3567.02, -120.69)
		elseif numb == 5 then
			convertedProp.gm13_final_pos = Vector(2284.38, 3577.02, -120.69)
		end
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
	spawn_dolls(trace.HitPos, numb)
	return true
end

function TOOL:RightClick(trace)
	if numb == 1 then
		numb = 2
	elseif numb == 2 then
		numb = 3
	elseif numb == 3 then
		numb = 4
	elseif numb == 4 then
		numb = 5
	elseif numb == 5 then
		numb = 1
	end
	if CLIENT then
		if numb == 1 then
			language.Add("Tool.spawn_dolls.right", "Change what to spawn, current type: 1")
		elseif numb == 2 then
			language.Add("Tool.spawn_dolls.right", "Change what to spawn, current type: 2")
		elseif numb == 3 then
			language.Add("Tool.spawn_dolls.right", "Change what to spawn, current type: 3")
		elseif numb == 4 then
			language.Add("Tool.spawn_dolls.right", "Change what to spawn, current type: 4")
		elseif numb == 5 then
			language.Add("Tool.spawn_dolls.right", "Change what to spawn, current type: 5")
		end
	end
	return true
end

function TOOL.BuildCPanel(pnl)
	pnl:AddControl("Header",{Text = "#Tool.spawn_dolls.name", Description = "#Tool.spawn_dolls.desc"})
end
