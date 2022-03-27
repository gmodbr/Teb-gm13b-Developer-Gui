--if CGM13D.ShowTools then
TOOL.Category = "gmc13b"
TOOL.Name = "#Tool.getpos.name"
TOOL.Command = nil
TOOL.ConfigName = ""
TOOL.Information = {
    { name = "left" },
    { name = "right" },
}

if CLIENT then
	language.Add("Tool.getpos.name", "Get Position")
	language.Add("Tool.getpos.desc", "Gets the position vector to 2 decimal places.")
	language.Add("Tool.getpos.left", "Get trace hit position.")
    language.Add("Tool.getpos.right", "Get player position.")
end

local function PrintPos(ply, pos)
	if SERVER then
		ply:ChatPrint("Vector(" .. math.Round(pos.x, 2) .. ", " .. math.Round(pos.y, 2) .. ", ".. math.Round(pos.z, 2) .. ")")
	end
end

function TOOL:LeftClick(trace)
	PrintPos(self:GetOwner(), trace.HitPos)
	return true
end
 
function TOOL:RightClick(trace)
	PrintPos(self:GetOwner(), self:GetOwner():GetPos())
	return false
end

function TOOL.BuildCPanel(pnl)
	pnl:AddControl("Header",{Text = "#Tool.getpos.name", Description = "#Tool.getpos.desc"})
end
--end