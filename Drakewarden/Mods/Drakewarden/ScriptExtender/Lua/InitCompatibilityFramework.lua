modGuid = "a951d531-dd86-4ff6-8d96-a5358fa95821"
subClassGuid = "ddddd47d-cc28-400e-bfa9-3a85baa70f24"

if Ext.Mod.IsModLoaded("67fbbd53-7c7d-4cfa-9409-6d737b4d92a9") then
  local subClasses = {
    AuthorSubclass = {
      modGuid = modGuid,
      subClassGuid = subClassGuid,
      class = "ranger",
      subClassName = "Drakewarden"
    }
  }

  local function OnStatsLoaded()
    Mods.SubclassCompatibilityFramework.Api.InsertSubClasses(subClasses)
  end

  Ext.Events.StatsLoaded:Subscribe(OnStatsLoaded)
end