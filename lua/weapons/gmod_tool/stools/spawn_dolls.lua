-- Rewrite
TOOL.Category = "C_GM13B_GUI_DEV"
TOOL.Name = "#tool.spawn_dolls.name"
TOOL.Command = nil
TOOL.ConfigName = ""
TOOL.ClientConVar[ "type" ] = "1"

TOOL.Information = {
	{ name = "left" },
	{ name = "right" },
	{ name = "reload" }
}

if CLIENT then
	language.Add("tool.spawn_dolls.name", "Spawn Dolls")
	language.Add("tool.spawn_dolls.desc", "Work In Progress!")
	language.Add("tool.spawn_dolls.left", "left")
    language.Add("tool.spawn_dolls.right", "right")
	language.Add("tool.spawn_dolls.type", "Type")
end

function TOOL:Reload( trace )
end

function TOOL:LeftClick( trace )
	local type = self:GetClientInfo( "type" )
	return false
end

function TOOL:RightClick( trace )
	return self:LeftClick( trace.HitPos )
end

list.Add( "listtype", "1" )
list.Add( "listtype", "2" )
list.Add( "listtype", "3" )
list.Add( "listtype", "4" )
list.Add( "listtype", "5" )
list.Add( "listtype", "6" )
list.Add( "listtype", "7" )

function TOOL.BuildCPanel( CPanel )

	-- Remove duplicates.
	local Options = {}
	for id, str in pairs( list.Get( "listtype" ) ) do
		if ( !table.HasValue( Options, str ) ) then
			table.insert( Options, str )
		end
	end

	table.sort( Options )

	local listbox = CPanel:AddControl( "ListBox", { Label = "#tool.spawn_dolls.type", Height = 17 + table.Count( Options ) * 17 } )
	for k, type in pairs( Options ) do
		local line = listbox:AddLine( type )
		line.data = { type = type }

		if ( GetConVarString( "type" ) == tostring( type ) ) then line:SetSelected( true ) end
	end

end