minetest.register_node('mylandscaping:mixer', {
	description = 'Concrete Mixer',
	drawtype = 'mesh',
	mesh = 'mylandscaping_crusher.obj',
	tiles = {
		{name='mylandscaping_tex1.png'},{name='mylandscaping_supports.png'},
      {name='mylandscaping_base.png'},{name='mylandscaping_hopper.png'},
      {name='mylandscaping_crusher.png'}},
	groups = {oddly_breakable_by_hand=2},
	paramtype = 'light',
	paramtype2 = 'facedir',
	selection_box = {
		type = 'fixed',
		fixed = {
			{-0.5, -0.5, -0.5, 1.5, 1.5, 0.5},
		}
	},
	collision_box = {
		type = 'fixed',
		fixed = {
			{-0.5, -0.5, -0.5, 1.5, 1.5, 0.5},
		}
	},

can_dig = function(pos,player)
	local meta = minetest.get_meta(pos);
	local inv = meta:get_inventory()
	if player:get_player_name() == meta:get_string('owner') and
	   inv:is_empty('cobble') and
	   inv:is_empty('gravel') and
	   inv:is_empty('concrete') and
	   inv:is_empty('sand') then
		return true
	else
	   return false
	end
end,

after_place_node = function(pos, placer, itemstack)
	local meta = minetest.get_meta(pos)
	local timer = minetest.get_node_timer(pos)
	meta:set_string('owner',placer:get_player_name())
	meta:set_string('infotext','Cement Mixer (owned by '..placer:get_player_name()..')')
	timer:start(10)
	end,

on_construct = function(pos)
	local meta = minetest.get_meta(pos)
	meta:set_string('formspec', 'size[9,10;]'..
	'background[-0.15,-0.25;9.40,10.75;mylandscaping_background.png]'..
	--Gravel
	'label[0.5,1;Cobble]'..
	'label[0.5,1.5;Crusher]'..
	'label[2.5,2;Cobble]'..
	'list[context;cobble;2.5,1;1,1;]'..
	'list[context;gravel;5.5,1;1,1;]'..
	'label[6.5,1;Gravel]'..
	--Concrete
	'label[5,0.5;Concrete Mixer]'..
	'list[context;sand;5.5,2.5;1,1;]'..
	'label[6.5,2.5;Sand]'..
	'list[context;concrete;5.5,4.5;1,1;]'..
	'label[6.5,4.5;Output]'..
	--Players Inven
	'list[current_player;main;0.5,6;8,4;]')
   meta:set_string('infotext', 'Concrete Mixer')
	local inv = meta:get_inventory()
	inv:set_size('cobble', 1)
	inv:set_size('gravel', 1)
	inv:set_size('concrete', 1)
	inv:set_size('sand', 1)
end,

   allow_metadata_inventory_put = function(pos, listname, index, stack, player)
      local input = stack:get_name()
      if listname == 'cobble' then
         if input == 'default:cobble' or minetest.get_item_group(input, 'ml') > 0 then
            return 99
         else
            return 0
         end
      elseif listname == 'gravel' then
         if input ~= 'default:gravel' then
            return 0
         else
            return 99
         end
      elseif listname == 'sand' then
         if minetest.get_item_group(input, 'sand') > 0 then
            return 99
         else
            return 0
         end
      elseif listname == 'concrete' then
         return 0
      end
   end,

on_timer = function(pos)
	local timer 	=	minetest.get_node_timer(pos)
	local meta 	= 	minetest.get_meta(pos)
	local inv 	= 	meta:get_inventory()
	local cobble 	= 	inv:get_stack('cobble', 1)
	local gravel 	= 	inv:get_stack('gravel', 1)
	local sand 	= 	inv:get_stack('sand', 1)
	local cobble_inv=	cobble:get_name()
   local sand_inv = sand:get_name()
----------------------------------------------------------------------
	if cobble:get_name() == 'default:cobble' or minetest.get_item_group(cobble_inv, 'ml') > 0 then
		inv:add_item('gravel','default:gravel')
		cobble:take_item()
		inv:set_stack('cobble',1,cobble)
	end
	if gravel:get_name() == 'default:gravel' and minetest.get_item_group(sand_inv, 'sand') > 0 then
		inv:add_item('concrete','mylandscaping:concrete_bag')
		gravel:take_item()
		inv:set_stack('gravel',1,gravel)
		sand:take_item()
		inv:set_stack('sand',1,sand)
	end
	timer:start(10)
end,
})
