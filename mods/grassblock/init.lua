--GRASSBLOCK
--A mod adding a grass block, raillike grass cover and 3 grass nodeboxes
--last updated 13/07/2013
minetest.register_alias("grassblock:hill", "grassblock:cover")
detail_level = 16
local slopebox = {}
local detail = detail_level
for i = 0, detail-1 do
	slopebox[i+1]={-0.5, (i/detail)-0.5, (i/detail)-0.5, 0.5, (i/detail)-0.5+(1/detail), 0.5}
end
minetest.register_node("grassblock:slope", {
	description = "Grass Slope",
	drawtype = "nodebox",
	tiles = {"default_grass.png"},
	paramtype = "light",
	paramtype2 = "facedir",
	walkable = true,
	selection_box = {
		type = "fixed",
		fixed = {-0.5, -0.5, -0.5, 0.5, 0.5, 0.5},
	},
	node_box = {
		type = "fixed",
		fixed = slopebox,
	},
	groups = {crumbly=3},
	})
	
	local slopeboxedge = {}
local detail = detail_level
for i = 0, detail-1 do
	slopeboxedge[i+1]={(i/detail)-0.5, -0.5, (i/detail)-0.5, 0.5, (i/detail)-0.5+(1/detail), 0.5}
end
minetest.register_node("grassblock:slope_edge", {
	description = "Outer Grass Slope",
	drawtype = "nodebox",
	tiles = {"default_grass.png"},
	paramtype = "light",
	paramtype2 = "facedir",
	walkable = true,
	selection_box = {
		type = "fixed",
		fixed = {-0.5, -0.5, -0.5, 0.5, 0.5, 0.5},
	},
	node_box = {
		type = "fixed",
		fixed = slopeboxedge,
	},
	groups = {crumbly=3},
	})
	
	minetest.register_node("grassblock:slope_inner_edge", {
	description = "Inner Grass Slope",
	drawtype = "nodebox",
	tiles = {"default_grass.png"},
	paramtype = "light",
	paramtype2 = "facedir",
	walkable = true,
	selection_box = {
		type = "fixed",
		fixed = {-0.5, -0.5, -0.5, 0.5, 0.5, 0.5},
	},
	node_box = {
		type = "fixed",
		fixed = {
			-- PART 1
			{-0.5, -0.5, -0.5, 0.5, -0.45, 0.5},
			{-0.45, -0.5, -0.5, 0.5, -0.4, 0.5},
			{-0.4, -0.5, -0.5, 0.5, -0.35, 0.5},
			{-0.35, -0.5, -0.5, 0.5, -0.3, 0.5},
			{-0.3, -0.5, -0.5, 0.5, -0.25, 0.5},
			{-0.25, -0.5, -0.5, 0.5, -0.2, 0.5},
			{-0.2, -0.5, -0.5, 0.5, -0.15, 0.5},
			{-0.15, -0.5, -0.5, 0.5, -0.1, 0.5},
			{-0.1, -0.5, -0.5, 0.5, -0.05, 0.5},
			{-0.05, -0.5, -0.5, 0.5, 0, 0.5},
			{0, -0.5, -0.5, 0.5, 0.05, 0.5},
			{0.05, -0.5, -0.5, 0.5, 0.1, 0.5},
			{0.1, -0.5, -0.5, 0.5, 0.15, 0.5},
			{0.15, -0.5, -0.5, 0.5, 0.2, 0.5},
			{0.2, -0.5, -0.5, 0.5, 0.25, 0.5},
			{0.25, -0.5, -0.5, 0.5, 0.3, 0.5},
			{0.3, -0.5, -0.5, 0.5, 0.35, 0.5},
			{0.35, -0.5, -0.5, 0.5, 0.4, 0.5},
			{0.4, -0.5, -0.5, 0.5, 0.45, 0.5},
			{0.45, -0.5, -0.5, 0.5, 0.5, 0.5},
			-- PART 2
			{-0.5, -0.5, -0.45, 0.5, -0.45, 0.5},
			{-0.5, -0.5, -0.4, 0.5, -0.4, 0.5},
			{-0.5, -0.5, -0.35, 0.5, -0.35, 0.5},
			{-0.5, -0.5, -0.3, 0.5, -0.3, 0.5},
			{-0.5, -0.5, -0.25, 0.5, -0.25, 0.5},
			{-0.5, -0.5, -0.2, 0.5, -0.2, 0.5},
			{-0.5, -0.5, -0.15, 0.5, -0.15, 0.5},
			{-0.5, -0.5, -0.1, 0.5, -0.1, 0.5},
			{-0.5, -0.5, -0.05, 0.5, -0.05, 0.5},
			{-0.5, -0.5, 0, 0.5, 0, 0.5},
			{-0.5, -0.5, 0.05, 0.5, 0.05, 0.5},
			{-0.5, -0.5, 0.1, 0.5, 0.1, 0.5},
			{-0.5, -0.5, 0.15, 0.5, 0.15, 0.5},
			{-0.5, -0.5, 0.2, 0.5, 0.2, 0.5},
			{-0.5, -0.5, .25, 0.5, 0.25, 0.5},
			{-0.5, -0.5, 0.3, 0.5, 0.3, 0.5},
			{-0.5, -0.5, 0.35, 0.5, 0.35, 0.5},
			{-0.5, -0.5, 0.4, 0.5, 0.4, 0.5},
			{-0.5, -0.5, 0.45, 0.5, 0.45, 0.5},
			{-0.5, -0.5, 0.5, 0.5, 0.5, 0.5},
			},
	},
	groups = {crumbly=3},
	})
	minetest.register_craft({
		output = '"grassblock:slope_inner_edge" 3',
		recipe = {
			{'', '', 'grassblock:block'},
			{'grassblock:block', '', ''},
			{'grassblock:block', 'grassblock:block', ''},		
		},
	})
	minetest.register_craft({
		output = '"grassblock:slope_inner_edge" 3',
		recipe = {
			{'grassblock:block', '', ''},
			{'', '', 'grassblock:block'},
			{'', 'grassblock:block', 'grassblock:block'},		
		},
	})
	
	minetest.register_craft({
		output = '"grassblock:slope_edge" 3',
		recipe = {
			{'', '', ''},
			{'grassblock:block', '', ''},
			{'grassblock:block', 'grassblock:block', ''},		
		},
	})
	minetest.register_craft({
		output = '"grassblock:slope_edge" 3',
		recipe = {
			{'', '', ''},
			{'', '', 'grassblock:block'},
			{'', 'grassblock:block', 'grassblock:block'},		
		},
	})
	
	minetest.register_craft({
		output = '"grassblock:slope" 6',
		recipe = {
			{'grassblock:block', '', ''},
			{'grassblock:block', 'grassblock:block', ''},
			{'grassblock:block', 'grassblock:block', 'grassblock:block'},		
		},
	})
	minetest.register_craft({
		output = '"grassblock:slope" 6',
		recipe = {
			{'', '', 'grassblock:block'},
			{'', 'grassblock:block', 'grassblock:block'},
			{'grassblock:block', 'grassblock:block', 'grassblock:block'},		
		},
	})


minetest.register_node("grassblock:block", {
	description = "Grass Block",
	tiles = {"default_grass.png"},
	is_ground_content = true,
	groups = {crumbly=3},
	sounds = default.node_sound_dirt_defaults({
		footstep = {name="default_grass_footstep", gain=0.4},
	}),
})

minetest.register_node("grassblock:cover", {
	description = "Grass Cover",
	drawtype = 'raillike',
	paramtype = 'light',
	walkable = false,
	tiles = {"default_grass.png"},
	is_ground_content = true,
	groups = {crumbly=3},
})
--Craft the block initially
minetest.register_craft({
	output = '"grassblock:block" 4',
	recipe = {
		{'', 'default:leaves', ''},
		{'default:leaves', 'default:dirt', 'default:leaves'},
		{'', 'default:leaves', ''},
	}
})
--Craft hills
minetest.register_craft({
	output = '"grassblock:cover" 9',
	recipe = {
		{'grassblock:block', '', ''},
		{'', 'grassblock:block', ''},
		{'', '', 'grassblock:block'},
	}
})

minetest.register_craft({
	output = '"grassblock:cover" 9',
	recipe = {
		{'', '', 'grassblock:block'},
		{'', 'grassblock:block', ''},
		{'grassblock:block', '', ''},
	}
})
minetest.register_craft({
	output = '"grassblock:block" 3',
	recipe = {
		{'grassblock:cover', 'grassblock:cover', 'grassblock:cover'},
		{'grassblock:cover', 'grassblock:cover', 'grassblock:cover'},
		{'grassblock:cover', 'grassblock:cover', 'grassblock:cover'},
	}
})
--Craft to dirt_with_grass
minetest.register_craft({
	output = 'default:dirt_with_grass',
	recipe = {
		{'grassblock:block'},
	}
})
--Craft from dirt_with_grass
minetest.register_craft({
	output = '"grassblock:block" 6',
	recipe = {
		{'default:dirt_with_grass', 'default:dirt_with_grass', 'default:dirt_with_grass'},
		{'default:dirt_with_grass', 'default:dirt_with_grass', 'default:dirt_with_grass'},
		}
})