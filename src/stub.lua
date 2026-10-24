-- Chef Shared Loader stub 1 - the game's `boot` script, replaced. --@@LOADER@@ (a copy of mine: never run as a guest)
-- Any mod can carry this file as its `boot`, unchanged: whichever copy the game runs (the last one deployed), it starts
-- the one loader Chef Shared Loader's own package deploys, so the deploy order of mods stops mattering. Without that
-- package the game stays as it is (four empty callbacks, as its own boot).
-- The loader itself is the Lua resource mods/chef/core_<n>; this stub looks for the newest n it knows (3 down to 1).
-- Its bytes never change for one stub number: copies from different mods must be the same file.

function init() end
function shutdown() end
function update(dt) end
function render() end

pcall(function()
  local S = rawget(_G, 'stingray')
  local can_get = S and S.Application and S.Application.can_get
  if type(can_get) ~= 'function' then return end
  for n = 3, 1, -1 do
    local name = 'mods/chef/core_' .. n
    local ok, there = pcall(can_get, 'lua', name)
    if ok and there == true then require(name); return end
  end
end)
