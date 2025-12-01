mylandscaping = {}
if core.settings:get_bool('mylandscaping.creative') then
   ml_visible = 0
else
   ml_visible = 1
end

--Load File
dofile(core.get_modpath('mylandscaping')..'/walls_freeport.lua')
dofile(core.get_modpath('mylandscaping')..'/walls_madison.lua')
dofile(core.get_modpath('mylandscaping')..'/walls_adaridge.lua')
dofile(core.get_modpath('mylandscaping')..'/walls_deco.lua')
dofile(core.get_modpath('mylandscaping')..'/stones.lua')
dofile(core.get_modpath('mylandscaping')..'/recipes.lua')
dofile(core.get_modpath('mylandscaping')..'/machine.lua')
dofile(core.get_modpath('mylandscaping')..'/mixer.lua')
dofile(core.get_modpath('mylandscaping')..'/concrete.lua')
dofile(core.get_modpath('mylandscaping')..'/formspec.lua')
dofile(core.get_modpath('mylandscaping')..'/toppers.lua')
