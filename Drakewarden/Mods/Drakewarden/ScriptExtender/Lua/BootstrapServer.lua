local function SummonPolymorphHackWorkaround()
    for _, entry in pairs(Osi.DB_PlayerSummons:Get(nil)) do
        local char = entry[1]
        print("Checking character: " .. char)
        local template = Osi.GetTemplate(char)
        print("Character template: " .. template)
        -- Check if the template starts with "Drakewarden_Companion_"
        if template:sub(1, #"Drakewarden_Companion_") == "Drakewarden_Companion_" then
            print("Applying polymorph hack to " .. char)
            Osi.ApplyStatus(char, "POLYMORPH_DRAKENCHEESE", 3, 1, char)
            Osi.ApplyStatus(char, "POLYMORPH_DRAKENCHEESE", 3, 1, char)
            Osi.ApplyStatus(char, "POLYMORPH_DRAKENCHEESE", 3, 1, char)
            print("Applied polymorph hack to " .. char)
        end
    end
end

-- console command
Ext.RegisterConsoleCommand("drakefix", function(cmd, ...)
    SummonPolymorphHackWorkaround()
    print("Polymorph hack workaround applied via console command.")
end)


Ext.Osiris.RegisterListener("LevelGameplayStarted", 2, "after", function (level, isEditorMode)
    Osi.TimerCancel("LykonPolymorphHack")
    Osi.TimerLaunch("LykonPolymorphHack", 1500)
end)

Ext.Osiris.RegisterListener("TimerFinished", 1, "after", function (timerName)
    if timerName == "LykonPolymorphHack" then
        Ext.Dump(Osi.DB_PlayerSummons:Get(nil))
        SummonPolymorphHackWorkaround()
        print("Polymorph hack workaround applied. Use !drakefix to apply again.")
    end
end)

Ext.Require("InitCompatibilityFramework.lua")