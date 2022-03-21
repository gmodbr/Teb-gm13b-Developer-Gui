local eventName = "zTableforBuildableRitual" 

local memoryName = "awaken" 

GM13.Event.Memory.Dependency:SetDependent(eventName, "awaken") 

hook.Add( "EntityTakeDamage", "EntityCustomHealthGM13BLCustomerigheuirhguierhgiuehrgwef32", function( target, dmginfo )
if target:IsPlayer() and dmginfo:GetAttacker():GetNWBool("customdamageenabledbeta13") == true then
dmginfo:ScaleDamage(0.5)
end
	if target:GetNWBool("customdamageenabledbeta13") then
		local damagetaken = dmginfo:GetDamage()
		target:SetNWFloat("CustomHealth",target:GetNWFloat("CustomHealth") - damagetaken )
		dmginfo:SetDamage(0)
		dmginfo:ScaleDamage(0)
		if target:GetNWFloat("CustomHealth") < 1 and target:GetNWBool("isdead") == false then
		PrintMessage(HUD_PRINTCENTER, "Father Grigori has dropped an Upgrade Kit.")
		PrintMessage(HUD_PRINTTALK, "Father Grigori has dropped an Upgrade Kit.")
		target:SetNWBool("isdead",true)
		GM13.Ent:Dissolve(target, 1)
		GM13.Map:BlockCleanup(false)
		target:EmitSound("vo/ravenholm/monk_death07.wav")
		local cr = ents.Create("prop_physics")
			cr:SetNWBool("upgradekit",true)
			cr:SetModel("models/weapons/w_package.mdl")
			cr:SetPos(target:GetPos()+Vector(0,0,10))
			cr:SetName("upgradekit")
			cr:Spawn()
			timer.Create("upgradekit"..cr:GetName().."_think_gm13", 0,0, function()
            if !IsValid(cr) then return end
            for _,c in pairs( ents.FindInSphere( cr:LocalToWorld(Vector(0,0,10) ), 20 ) ) do

                if !IsValid(c) then return end

                if c:GetClass() == "gm13_func_button" and c:GetName() == "radio" then
					cr:EmitSound("items/suitchargeok1.wav")
					c:SetNWInt("tierlevel",c:GetNWInt("tierlevel") + 1)
					PrintMessage(HUD_PRINTCENTER, "The Radio has been upgraded to Level "..c:GetNWInt("tierlevel") + 1)
					PrintMessage(HUD_PRINTTALK, "The Radio has been upgraded to Level "..c:GetNWInt("tierlevel") + 1)
					if c:GetNWInt("tierlevel") + 1 == 2 then
					PrintMessage(HUD_PRINTTALK, "Level 2 Radio: More Transmissions unlocked.")
					end
                    cr:Remove()

                end
				
				if c:GetClass() == "gm13_sent_curse_detector" then
					cr:EmitSound("items/suitchargeok1.wav")
					c:SetNWInt("tierlevel",c:GetNWInt("tierlevel") + 1)
					PrintMessage(HUD_PRINTCENTER, "The Curse Detector has been upgraded to Level "..c:GetNWInt("tierlevel") + 1)
					PrintMessage(HUD_PRINTTALK, "The Curse Detector has been upgraded to Level "..c:GetNWInt("tierlevel") + 1)
					if c:GetNWInt("tierlevel") + 1 == 3 then
					PrintMessage(HUD_PRINTTALK, "Level 3 Curse Detector: Each time a player gets healed, the player gains armor of the same amount.")
					end
                    if c:GetNWInt("tierlevel") + 1 == 2 then
					PrintMessage(HUD_PRINTTALK, "Level 2 Curse Detector: Heals players while any player is near it. Every level after 2 gains faster healing.")
					for k, detector in ipairs(ents.GetAll()) do
					if detector:GetClass() == "gmod_light" then
					detector:SetNWBool("readyheal",true)
					end
					end
					timer.Create("cursedetectorlevel2_think_gm13", 0,0, function()
					for k, detector in ipairs(ents.GetAll()) do
					if detector:GetClass() == "gmod_light" then
					local parent = detector:GetParent()
					if parent:GetClass() == "gm13_sent_curse_detector" then
					for _,ply in pairs( ents.FindInSphere( parent:LocalToWorld(Vector(0,0,10) ), 150 ) ) do
					if ply:IsPlayer() then
					if ply:Health() ~= ply:GetMaxHealth() then
					if detector:GetNWBool("readyheal") then
					local effectdata = EffectData()
					effectdata:SetOrigin( ply:GetPos() )
					effectdata:SetStart(detector:GetPos())
					util.Effect( "ToolTracer", effectdata )
					end
					if detector:GetNWBool("readyheal") then
					timer.Simple(2 / ( c:GetNWInt("tierlevel") + 1 ), function()
					if detector:IsValid() then
					if detector:GetNWBool("readyheal") == false then
					detector:SetNWBool("readyheal",true)
					end
					end
					end)
					detector:SetNWBool("readyheal",false)
					ply:SetHealth(ply:Health() + 3)
					ply:EmitSound("items/medshot4.wav")
					if c:GetNWInt("tierlevel") + 1 >= 3 then
					ply:SetArmor(ply:Armor() + 3)
					ply:EmitSound("items/battery_pickup.wav")
					if ply:Armor() >= ply:GetMaxArmor() then
					ply:SetArmor(ply:GetMaxArmor())
					end
					end
					if ply:Health() >= ply:GetMaxHealth() then
					ply:SetHealth(ply:GetMaxHealth())
					end
					end
					end
					end
					end
					end
					end
					end
					end)
					end
				   cr:Remove()
                end
            end
        end)
		end
	end
end )

timer.Remove("cursedetectorlevel2_think_gm13")

local function MainEvent()
local marker = ents.Create("gm13_marker")
local st = Vector(2322.89, 3654.01, -167.97)
marker:SetPos(st)
marker:Setup(eventName,"checkForItems",st + Vector(100,100,100),st + Vector(-100,-100,-100))
hook.Add("Think","itemcheckthgiujhigh34uihfiu34hfu345hg4",function()
for _,c in pairs( ents.FindInSphere( marker:LocalToWorld(Vector(0,0,10) ), 100 ) ) do
if c:GetClass() == "prop_dynamic" and c:GetName() == "Table" and c:GetNWInt("itemsontable") >= 1 then
c:SetNWInt("itemsontable",0)
c:EmitSound("vo/ravenholm/madlaugh03.wav")
timer.Simple(5,function()
if c:IsValid() then
c:EmitSound("vo/ravenholm/firetrap_welldone.wav")
end
end)
local monk = ents.Create("npc_monk")
timer.Simple(7,function()
if c:IsValid() then
monk:SetPos(Vector(2540.65, 3558.35, -167.97))
monk:SetAngles(Angle(0,190,0))
monk:Spawn()
GM13.NPC:AttackClosestPlayer(monk)
monk:SetNWFloat("CustomHealth",1)
monk:SetNWBool("isdead",false)
GM13.Map:BlockCleanup(true)
monk:SetNWBool("customdamageenabledbeta13",true)
monk:Give( "weapon_annabelle" )
for _, ply in ipairs( player.GetAll() ) do
    ply:GodDisable()
end
for k, ent in ipairs(ents.GetAll()) do
		if ent:IsNPC() or ent:IsNextBot() then
		monk:AddEntityRelationship(ent, D_HT, 99)
        ent:AddEntityRelationship(monk, D_HT, 99)
		end
		if ent:GetName() == "ratman" then
		GM13.Ent:Dissolve(ent, 1)
		ent:EmitSound("npc/stalker/go_alert2.wav")
		end
    end
monk:GetActiveWeapon():SetClip1(50000)
end
end)
local tp = c:GetPos()
for _,p in pairs( ents.FindInBox( tp + Vector(250,250,250),tp + Vector(-250,-250,-250) ) ) do
if p:GetNWBool("ritualprop") == true then
GM13.Ent:Dissolve(p, 2)
end
end
end
end
end)
end

local function Failed()
end

local function CreateEvent()

    if GM13.Event.Memory:Get("awaken") then 
        MainEvent()
    end

    return true 

end

GM13.Event:SetCall(eventName, CreateEvent)
