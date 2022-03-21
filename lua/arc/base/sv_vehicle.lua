
-- Break vehicles (By Zaurzo)

hook.Add("OnEntityCreated", "cgm13_SetSoundTable", function(e)
    if not e:IsVehicle() then return end
    local StopSoundTable = {}
    e:SetVar("SoundTable", StopSoundTable)
end)

hook.Add("EntityEmitSound", "cgm13_GetSCarSoundList", function(d)
    if not d.Entity or not IsValid(d.Entity) then return end
    if not d.Entity:IsVehicle() then return end
    local e = d.Entity
    local SoundList = e:GetVar("SoundTable")
    table.insert(SoundList, d.SoundName)
    e:SetVar("SoundTable", SoundList)
    -- Some vehicle engine sounds don't stop upon engine break
    -- So we add it to a table and stop the sound when necessary
end)

function CGM13.Vehicle:Break(vehicle, value)

    if not vehicle or not IsValid(vehicle) then return end
    if not vehicle:IsVehicle() then return end

    if vehicle.StartEngine then
        vehicle:StartEngine(false)
        vehicle:SetSequence("idle")
    end

    if vehicle.Think then
        vehicle.Think = function() return end
    end

    for _,sounds in pairs( vehicle:GetVar("SoundTable") ) do
        vehicle:StopSound(sounds)
    end

    vehicle:SetNWBool("cgm13_burned_engine", true)
    GM13.Ent:SetMute(vehicle, true)

end

function CGM13.Vehicle:IsBroken(vehicle)
    return vehicle:GetNWBool("cgm13_burned_engine")
end

local ENT = FindMetaTable("Entity")
local SetNWBool = ENT.SetNWBool
ENT.SetNWBool = function(self, value, ...)
    if CGM13.Vehicle:IsBroken(self) and value == "cgm13_burned_engine" then return end
    return SetNWBool(self, value, ...)
end

hook.Add("VehicleMove", "cgm13_vehicle_control", function(ply, vehicle)
    if CGM13.Vehicle:IsBroken(vehicle) then
        vehicle:StartEngine(false)
        vehicle.Think = function() return end
    end
end)
