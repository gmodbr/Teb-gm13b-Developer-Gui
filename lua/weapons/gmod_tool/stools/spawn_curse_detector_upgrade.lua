TOOL.Category = "gmc13b"
TOOL.Name = "#Tool.spawn_curse_detector_upgrade.name"
TOOL.Command = nil
TOOL.ConfigName = ""
TOOL.Information = {
    { name = "left" },
}

if CLIENT then
	language.Add("Tool.spawn_curse_detector_upgrade.name", "Curse Detector Upgrade")
	language.Add("Tool.spawn_curse_detector_upgrade.desc", "Spawns Curse Detector Upgrade")
	language.Add("Tool.spawn_curse_detector_upgrade.left", "Spawn Curse Detector Upgrade")
end

local function spawn_curse_detector_upgrade(pos)
	if SERVER then
		local pos2 = Vector(math.Round(pos.x, 2), math.Round(pos.y, 2), math.Round(pos.z, 2))
		local spawn_curse_detector_upgrade = ents.Create("prop_physics")
		spawn_curse_detector_upgrade:SetNWBool("upgradekit", true)
		spawn_curse_detector_upgrade:SetName("upgradekit")
		spawn_curse_detector_upgrade:SetModel("models/weapons/w_package.mdl")
		spawn_curse_detector_upgrade:Spawn()
		spawn_curse_detector_upgrade:SetPos(pos2 + Vector(0, 0, 10))

		local function _PrintMessage(messageType, message)
			PrintMessage(messageType, message)
		end
		local function SetConeAutoHeal()
			local curseDetector = ents.FindByClass("gm13_sent_curse_detector")[1]
			if curseDetector then
				curseDetector:SetNWBool("readyheal", true)
				local currentLevel = GM13.Event.Memory:Get("coneLevel")
				if not currentLevel then return end
				local areaMultiplier = currentLevel / 2 
				CGM13.Custom:ProximityTrigger(eventName, "Touch", curseDetector, curseDetector:GetPos(), 150, 75 * areaMultiplier, function(ent)
					if not ent:IsPlayer() and not ent:IsNPC() then return end
					if ent:IsNPC() then 
						local somePlayer
						for k, v in ipairs(player.GetHumans()) do
							somePlayer = v
							break
						end
						if ent:Disposition(somePlayer) < 3 then -- https://wiki.facepunch.com/gmod/Enums/D
							return
						end
					end
					if ent:Health() == ent:GetMaxHealth() then return end
					if curseDetector:GetNWBool("readyheal") then
						curseDetector:SetNWBool("readyheal", false)
						local effectdata = EffectData()
						effectdata:SetOrigin(ent:EyePos() - Vector(0, 0, 20))
						effectdata:SetStart(curseDetector.light:GetPos())
						curseDetector.light:SetColor(Color(47, 225, 237, 255))
						curseDetector.light:SetOn(true)
						timer.Simple(0.2, function()
							if curseDetector:IsValid() then
								curseDetector.light:SetOn(false)
								curseDetector.light:SetColor(Color(255, 255, 255, 255))
							end
						end)
						util.Effect("ToolTracer", effectdata)
						timer.Simple(2 / currentLevel, function()
							if curseDetector:IsValid() then
								curseDetector:SetNWBool("readyheal", true)
							end
						end)
						ent:SetHealth(ent:Health() + 3)
						ent:EmitSound("items/medshot4.wav")
						if ent:IsPlayer() and currentLevel >= 3 then
							ent:SetArmor(ent:Armor() + 3)
							ent:EmitSound("items/battery_pickup.wav")
							if ent:Armor() >= ent:GetMaxArmor() then
								ent:SetArmor(ent:GetMaxArmor())
							end
						end
						if ent:Health() >= ent:GetMaxHealth() then
							ent:SetHealth(ent:GetMaxHealth())
						end
					end
				end)
				curseDetector:CallOnRemove("cgm13_restore_cone_healing", function()
					timer.Simple(2, function()
						SetConeAutoHeal()
					end)
				end)
			end
		end
		local timerName = "cgm13_upgradekit_check_" .. tostring(spawn_curse_detector_upgrade)-- from https://github.com/Xalalau/Anomaly-Research-Center-ARC/blob/master/lua/arc/events/tier1/submarine/sv_notgrigori.lua
		timer.Create(timerName, 1, 0, function()
			if not IsValid(spawn_curse_detector_upgrade) then
				timer.Remove(timerName)	
				return
			end
			for _, ent in pairs(ents.FindInSphere(spawn_curse_detector_upgrade:LocalToWorld(Vector(0, 0, 10)), 20)) do
				if ent:GetClass() == "gm13_sent_curse_detector" then
					if GM13.Event.Memory:Get("coneLevel") == 10 then
						GM13.Ent:FadeOut(spawn_curse_detector_upgrade, 0.5, function() spawn_curse_detector_upgrade:Remove() 
							GM13.Ent:Dissolve(ent, 3) 
						end)
						return
					end
					spawn_curse_detector_upgrade:EmitSound("items/suitchargeok1.wav")
					local oldLevel = GM13.Event.Memory:Get("coneLevel") or 1
					local newLevel = oldLevel + 1
					GM13.Event.Memory:Set("coneLevel", newLevel)
					_PrintMessage(HUD_PRINTCENTER, "The Curse Detector has been upgraded to Level " .. newLevel)
					_PrintMessage(HUD_PRINTTALK,"The Curse Detector has been upgraded to Level " .. newLevel)
					if newLevel == 2 then
						_PrintMessage(HUD_PRINTTALK, "Level 2 Curse Detector: Heals players while any player is near it. Every level after 2 gains faster healing.")
					end
					if newLevel == 3 then
						_PrintMessage(HUD_PRINTTALK, "Level 3 Curse Detector: Each time a player gets healed, the player gains armor of the same amount. Every level after 3 increases healing area.")
					end
					SetConeAutoHeal()
					spawn_curse_detector_upgrade:Remove()
					break
				end
			end
		end)
	end
end

function TOOL:LeftClick(trace)
	spawn_curse_detector_upgrade(trace.HitPos)
	return true
end

function TOOL.BuildCPanel(pnl)
	pnl:AddControl("Header",{Text = "#Tool.spawn_curse_detector_upgrade.name", Description = "#Tool.spawn_curse_detector_upgrade.desc"})
end