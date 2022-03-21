-- // Zaurzo's Custom SandEv event base for gm_construct_13_beta \\ --

local eventName = "zrandomDoll5" 

local memoryName = "zMemory5" 

GM13.Event.Memory.Dependency:SetDependent(eventName, "awaken") 
GM13.Event.Memory.Incompatibility:Set(eventName, "zombieApocalypse5")

local ahook = hook.Add
local rhook = hook.Remove
local mr = math.random

local function SpawnDoll5()

    local marker = ents.Create("gm13_marker")
    local startp = Vector(-2945.69, -1373.88, -74.16)+Vector(0,0,10)
    marker:Setup(eventName, "zrDoll_Marker5", startp + Vector(10,10,10), startp + Vector(-10,-10,-10) )

    local function GetHost()
        if not _LISTEN_SERVER_HOST then
            for id, ply in pairs( player.GetAll( ) ) do
                if IsValid( ply ) and ply:IsListenServerHost( ) then
                    _LISTEN_SERVER_HOST = id
                    return ply
                end
            end
            return -- return nil if no player found
        end
        return player.GetAll()[_LISTEN_SERVER_HOST]
    end

    local zombie_allowed_to_spawn_zGM13 = false

    local randomV = {
		Vector(2352.191162, 3370.543945, -127.052246),
		--Vector(754.604919, -1361.564331, 1360.031250),
		--Vector(-2856.869141, -2388.120361, 284.031250),
		--Vector(-2901.221924, -1473.495483, -79.968750),
		--Vector(736.031250, -1824.031250, -79.968750),
		--Vector(736.031250, -1375.968750, -79.968750),
		--Vector(-4733.438965, 5582.304688, 2273.031250),
		--Vector(2991.968750, 5703.968750, -103.968750),
    }

    local randomA = {
		Angle(0,90,0),
		--Angle(0,-190,0),
		--Angle(0,0,0),
		--Angle(0,0,0),
		--Angle(0,0,0),
		--Angle(0,0,0),
		--Angle(0,0,0),
		--Angle(0,0,0),
    }

    local r = mr(1,1)

    local pos = randomV[r]
    local ang = randomA[r]

    local doll5 = ents.Create("prop_physics")
    doll5:SetModel("models/props_interiors/Furniture_shelf01a.mdl")
    doll5:SetPos(pos + Vector(0,0,5))
	GM13.Ent:FadeIn(doll5, 1.2)
    doll5:SetAngles(ang)
    doll5:PhysicsInit(SOLID_VPHYSICS)
    doll5:SetMoveType(MOVETYPE_VPHYSICS)
    doll5:SetSolid(SOLID_VPHYSICS)
    doll5:SetMaxHealth(1)
    doll5:SetHealth(1)
    doll5:SetName("zdoll5_GM13")
    doll5:SetVar("ready_for_hit_zdoll5", true)
    doll5:SetVar("ready_for_spawn_zdoll5_GM13", true)
    if doll5:GetVar("ready_for_spawn_zdoll5_GM13") then
    doll5:Spawn()
    end
    local p = doll5:GetPhysicsObject()
    if IsValid(p) then p:Wake() end

    ahook("EntityTakeDamage", "zrandomDoll_TookDamage_Activate_UNID_155125GM13z", function(t) 
        if t:GetName("zdoll5_GM13") and t:GetVar("ready_for_hit_zdoll5") then
    
            t:SetVar("ready_for_hit_zdoll5", false)
            t:SetColor(Color(255,0,0))
			t:SetHealth(999999)
            t:EmitSound("/vo/citadel/br_youneedme.wav",75,80)
			local cr = ents.Create("prop_physics")
			cr:SetNWBool("ritualprop",true)
    
            GM13.Ent:FadeOut(t, 3, function() cr:SetModel("models/maxofs2d/companion_doll.mdl") cr:SetPos(doll5:GetPos()+Vector(0,0,10)) cr:SetName("doll_gm13_c13b")cr:Spawn()cr:SetHealth(9999999)GM13.Ent:Dissolve(t, 3) 
                   local function OneShot5(c)
            if c and isfunction(c) then
                if cr:GetPos() != Vector(2284.38, 3557.02, -85.69) then
                    c()
                end
            end
        end
			timer.Create("doll_think_gm13", 0,0, function()
            if !IsValid(cr) then return end
            for _,c in pairs( ents.FindInSphere( cr:LocalToWorld(Vector(0,0,10) ), 100 ) ) do

                if !IsValid(c) then return end

                if c:GetClass() == "prop_dynamic" and c:GetName() == "Table" then

                    OneShot5(function()

                        cr:EmitSound("physics/metal/metal_solid_impact_hard4.wav")
						c:SetPos(Vector(2285.914063, 3554.912109, -149.480362))
						c:SetAngles(Angle(0,0,0))
						GM13.Ent:SetInvulnerable(c, true)
						c:SetNWInt("itemsontable",c:GetNWInt("itemsontable") + 1)


                        cr:PhysicsInit(SOLID_NONE)
                        timer.Simple(0.1, function() 
                            if IsValid(cr) then cr:PhysicsInit(SOLID_VPHYSICS) 
                            end 
                        end)
                        
                        zGM13.Function:Repeat(Blink, 25, 0.15, function() -- sh_zcustom.lua

                        end)

                    end)

                    cr:SetMoveType(MOVETYPE_NONE)
                    cr:SetPos(Vector(2284.38, 3557.02, -85.69))
                    cr:SetAngles(Angle(0,0,0))
                    c:SetMoveType(MOVETYPE_NONE)

                    GM13.Ent:BlockPhysgun(cr,y)
                    GM13.Ent:BlockToolgun(cr,y)

                end
            end
        end)
			
end)
    
        end
    end )
    

end

local function CreateEvent()

    if GM13.Event.Memory:Get("awaken") then 
        SpawnDoll5()
    end

    return true 

end

GM13.Event:SetCall(eventName, CreateEvent)
