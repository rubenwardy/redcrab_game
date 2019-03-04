-- Redefinitions of some default crafting recipes

minetest.register_craft({
	output = "default:sign_wall 4",
	recipe = {
		{"default:wood", "default:wood", "default:wood"},
		{"default:wood", "default:wood", "default:wood"},
		{"", "default:stick", ""},
	}
})

minetest.register_craft({
	output = "default:ladder 3",
	recipe = {
		{"default:stick", "", "default:stick"},
		{"default:stick", "default:stick", "default:stick"},
		{"default:stick", "", "default:stick"},
	}
})

minetest.register_craft({
	output = "default:paper 3",
	recipe = {
		{"default:papyrus", "default:papyrus", "default:papyrus"},
	}
})

minetest.register_craft({
	output = "default:rail 16",
	recipe = {
		{"default:steel_ingot", "", "default:steel_ingot"},
		{"default:steel_ingot", "default:stick", "default:steel_ingot"},
		{"default:steel_ingot", "", "default:steel_ingot"},
	}
})

minetest.register_craft({
	output = "default:axe_wood",
	recipe = {
		{"default:wood", "default:wood"},
		{"default:stick", "default:wood"},
		{"default:stick", ""},
	}
})

minetest.register_craft({
	output = "default:axe_stone",
	recipe = {
		{"default:cobble", "default:cobble"},
		{"default:stick", "default:cobble"},
		{"default:stick", ""},
	}
})

minetest.register_craft({
	output = "default:axe_steel",
	recipe = {
		{"default:steel_ingot", "default:steel_ingot"},
		{"default:stick", "default:steel_ingot"},
		{"default:stick", ""},
	}
})

-- Tool repair buff (15% bonus instead of 2%)

minetest.register_craft({
	type = "toolrepair",
	additional_wear = -0.15,
})

-- Redefinitions of some default nodes

minetest.register_node(":default:ladder", {
	description = "Ladder",
	drawtype = "signlike",
	tiles = {"default_ladder.png"},
	inventory_image = "default_ladder.png",
	wield_image = "default_ladder.png",
	paramtype = "light",
	sunlight_propagates = true,
	paramtype2 = "wallmounted",
	walkable = false,
	climbable = true,
	selection_box = {
		type = "wallmounted",
	},
	groups = {snappy=1,choppy=2,oddly_breakable_by_hand=3,flammable=2},
	legacy_wallmounted = true,
	sounds = default.node_sound_wood_defaults(),
})

if wood_facedir == true
then
minetest.register_node(":default:wood", {
	description = "Wooden Planks",
	tiles = {"default_wood.png"},
	paramtype2 = "facedir",
	groups = {snappy=1,choppy=2,oddly_breakable_by_hand=2,flammable=3,wood=1},
	sounds = default.node_sound_wood_defaults(),
})
end

minetest.register_node(":default:sapling", {
	description = "Sapling",
	drawtype = "plantlike",
	visual_scale = 1.0,
	tiles = {"default_sapling.png"},
	inventory_image = "default_sapling.png",
	wield_image = "default_sapling.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {-0.3, -0.5, -0.3, 0.3, 0.35, 0.3}
	},
	groups = {snappy=2,dig_immediate=3,flammable=2,attached_node=1},
	sounds = default.node_sound_defaults(),
})

minetest.register_node(":default:dry_shrub", {
	description = "Dry Shrub",
	drawtype = "plantlike",
	visual_scale = 1.0,
	tiles = {"default_dry_shrub.png"},
	inventory_image = "default_dry_shrub.png",
	wield_image = "default_dry_shrub.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	groups = {snappy=3,flammable=3,attached_node=1},
	sounds = default.node_sound_leaves_defaults(),
	selection_box = {
		type = "fixed",
		fixed = {-1/3, -1/2, -1/3, 1/3, 1/6, 1/3},
	},
})

minetest.register_node(":default:papyrus", {
	description = "Papyrus",
	drawtype = "plantlike",
	tiles = {"default_papyrus.png"},
	inventory_image = "default_papyrus.png",
	wield_image = "default_papyrus.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {-0.3, -0.5, -0.3, 0.3, 0.5, 0.3}
	},
	groups = {snappy=3,flammable=2},
	sounds = default.node_sound_leaves_defaults(),
})

minetest.register_node(":default:fence_wood", {
	description = "Wooden Fence",
	drawtype = "fencelike",
	tiles = {"default_wood.png"},
	inventory_image = "default_fence.png",
	wield_image = "default_fence.png",
	paramtype = "light",
	sunlight_propagates = true,
	selection_box = {
		type = "fixed",
		fixed = {-1/7, -1/2, -1/7, 1/7, 1/2, 1/7},
	},
	groups = {snappy=1,choppy=2,oddly_breakable_by_hand=2,flammable=2},
	sounds = default.node_sound_wood_defaults(),
})
