minetest.register_craft({
	output = 'mylandscaping:machine',
	recipe = {
		{'default:shovel_steel', 'bucket:bucket_water', ''},
		{'default:steel_ingot', 'mylandscaping:concrete_bag', 'default:steel_ingot'},
		{'default:steel_ingot', 'default:steel_ingot', 'default:steel_ingot'},
		}
})

minetest.register_craft({
	output = 'mylandscaping:mixer',
	recipe = {
		{'default:pick_steel', 'default:paper', 'default:chest'},
		{'group:stick', 'default:paper', 'group:stick'},
		{'default:steel_ingot', 'default:steel_ingot', 'default:steel_ingot'},
		}
})

minetest.register_craft({
	output = 'mylandscaping:concrete',
	recipe = {
		{'', '', ''},
		{'', '', ''},
		{'', '', ''},
		}
})

minetest.register_craftitem('mylandscaping:concrete_bag', {
	description = 'Bag of Concrete Mix',
	inventory_image = 'mylandscaping_cement_bag.png',
})
