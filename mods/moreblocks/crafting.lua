-- Crafting

minetest.register_craft({
	output = "default:stick 1",
	recipe = {
		{"default:dry_shrub"},
	}
})

minetest.register_craft({
	output = "default:dirt_with_grass 1",
	recipe = {
		{"default:junglegrass"},
		{"default:dirt"},
	}
})

minetest.register_craft({
	output = "default:dirt_with_grass 1",
	recipe = {
		{"default:mese"},
		{"default:dirt"},
	}
})

minetest.register_craft({
	output = "default:mossycobble 1",
	recipe = {
		{"default:junglegrass"},
		{"default:cobble"},
	}
})

minetest.register_craft({
	output = "default:mossycobble 1",
	recipe = {
		{"default:mese"},
		{"default:cobble"},
	}
})

minetest.register_craft({
	output = "moreblocks:junglewood 4",
	recipe = {
		{"default:jungletree"},
	}
})

minetest.register_craft({
	output = "moreblocks:woodtile 9",
	recipe = {
		{"default:wood", "default:wood", "default:wood"},
		{"default:wood", "default:wood", "default:wood"},
		{"default:wood", "default:wood", "default:wood"},
	}
})

minetest.register_craft({
	output = "moreblocks:woodtile_flipped 1",
	recipe = {
		{"moreblocks:woodtile"},
	}
})

minetest.register_craft({
	output = "moreblocks:woodtile_center 9",
	recipe = {
		{"default:wood", "default:wood", "default:wood"},
		{"default:wood", "moreblocks:woodtile", "default:wood"},
		{"default:wood", "default:wood", "default:wood"},
	}
})

minetest.register_craft({
	output = "moreblocks:woodtile_full 4",
	recipe = {
		{"moreblocks:woodtile", "moreblocks:woodtile"},
		{"moreblocks:woodtile", "moreblocks:woodtile"},
	}
})

minetest.register_craft({
	output = "moreblocks:woodtile_up 1",
	recipe = {
		{"default:stick"},
		{"moreblocks:woodtile_center"},
	}
})

minetest.register_craft({
	output = "moreblocks:woodtile_down 1",
	recipe = {
		{"moreblocks:woodtile_center"},
		{"default:stick"},
	}
})

minetest.register_craft({
	output = "moreblocks:woodtile_left 1",
	recipe = {
		{"default:stick", "moreblocks:woodtile_center"},
	}
})

minetest.register_craft({
	output = "moreblocks:woodtile_right 1",
	recipe = {
		{"moreblocks:woodtile_center", "default:stick"},
	}
})

minetest.register_craft({
	output = "moreblocks:junglestick 4",
	recipe = {
		{"moreblocks:junglewood"},
	}
})

minetest.register_craft({
	output = "moreblocks:fence_junglewood 2",
	recipe = {
		{"moreblocks:junglestick", "moreblocks:junglestick", "moreblocks:junglestick"},
		{"moreblocks:junglestick", "moreblocks:junglestick", "moreblocks:junglestick"},
	}
})

minetest.register_craft({
	output = "moreblocks:stonebrick 4",
	recipe = {
		{"default:stone", "default:stone"},
		{"default:stone", "default:stone"},
	}
})

minetest.register_craft({
	output = "moreblocks:circlestonebrick 8",
	recipe = {
		{"default:stone", "default:stone", "default:stone"},
		{"default:stone", "", "default:stone"},
		{"default:stone", "default:stone", "default:stone"},
	}
})

minetest.register_craft({
	output = "moreblocks:allfacestree 8",
	recipe = {
		{"default:tree", "default:tree", "default:tree"},
		{"default:tree", "", "default:tree"},
		{"default:tree", "default:tree", "default:tree"},
	}
})

minetest.register_craft({
	output = "moreblocks:sweeper 3",
	recipe = {
		{"default:junglegrass"},
		{"default:stick"},
	}
})

minetest.register_craft({
	output = "moreblocks:stonesquare 4",
	recipe = {
		{"default:cobble", "default:cobble"},
		{"default:cobble", "default:cobble"},
	}
})

minetest.register_craft({
	output = "moreblocks:splitstonesquare 1",
	recipe = {
		{"moreblocks:stonesquare"},
	}
})

minetest.register_craft({
	output = "moreblocks:emptybookshelf 1",
	recipe = {
		{"moreblocks:sweeper"},
		{"default:bookshelf"},
	}
})

minetest.register_craft({
	output = "moreblocks:ironstonebrick 1",
	recipe = {
		{"default:steel_ingot"},
		{"moreblocks:stonebrick"},
	}
})

minetest.register_craft({
	output = "default:wood 4",
	recipe = {
		{"moreblocks:horizontaltree"},
	}
})

minetest.register_craft({
	output = "moreblocks:junglewood 4",
	recipe = {
		{"moreblocks:horizontaljungletree"},
	}
})

minetest.register_craft({
	output = "moreblocks:plankstone 4",
	recipe = {
		{"default:stone", "default:wood"},
		{"default:wood", "default:stone"},
	}
})

minetest.register_craft({
	output = "moreblocks:plankstone 4",
	recipe = {
		{"default:wood", "default:stone"},
		{"default:stone", "default:wood"},
	}
})

minetest.register_craft({
	output = "moreblocks:coalchecker 4",
	recipe = {
		{"default:stone", "default:coal_lump"},
		{"default:coal_lump", "default:stone"},
	}
})

minetest.register_craft({
	output = "moreblocks:coalchecker 4",
	recipe = {
		{"default:coal_lump", "default:stone"},
		{"default:stone", "default:coal_lump"},
	}
})

minetest.register_craft({
	output = "moreblocks:ironchecker 4",
	recipe = {
		{"steel_ingot", "default:stone"},
		{"default:stone", "steel_ingot"},
	}
})

minetest.register_craft({
	output = "default:chest_locked 1",
	recipe = {
		{"steel_ingot"},
		{"chest"},
	}
})

minetest.register_craft({
	output = "moreblocks:ironchecker 4",
	recipe = {
		{"default:stone", "steel_ingot"},
		{"steel_ingot", "default:stone"},
	}
})

minetest.register_craft({
	output = "moreblocks:ironglass 1",
	recipe = {
		{"steel_ingot"},
		{"default:glass"},
	}
})

minetest.register_craft({
	output = "moreblocks:coalglass 1",
	recipe = {
		{"default:coal_lump"},
		{"default:glass"},
	}
})

minetest.register_craft({
	output = "moreblocks:cleanglass 1",
	type = "shapeless",
	recipe = {"moreblocks:sweeper", "default:glass"},
})

minetest.register_craft({
	output = "moreblocks:glowglass 1",
	type = "shapeless",
	recipe = {"default:torch", "default:glass"},
})

minetest.register_craft({
	output = "moreblocks:superglowglass 1",
	type = "shapeless",
	recipe = {"default:torch", "default:torch", "default:glass"},
})

minetest.register_craft({
	output = "moreblocks:coalstone 1",
	type = "shapeless",
	recipe = {"default:coal_lump", "default:stone"},
})

minetest.register_craft({
	output = "moreblocks:trapstone 12",
	recipe = {
		{"default:mese"},
		{"default:stone"},
	}
})

minetest.register_craft({
	output = "moreblocks:trapglass 12",
	recipe = {
		{"default:mese"},
		{"default:glass"},
	}
})

minetest.register_craft({
	output = "moreblocks:ironstone 1",
	type = "shapeless",
	recipe = {"default:iron_lump", "default:stone"},
})

minetest.register_craft({
	output = "moreblocks:cactusbrick 1",
	type = "shapeless",
	recipe = {"default:cactus", "default:brick"},
})

minetest.register_craft({
	output = "moreblocks:cactuschecker 4",
	recipe = {
		{"default:cactus", "default:stone"},
		{"default:stone", "default:cactus"},
	}
})

minetest.register_craft({
	output = "moreblocks:cactuschecker 4",
	recipe = {
		{"default:stone", "default:cactus"},
		{"default:cactus", "default:stone"},
	}
})

minetest.register_craft({
	output = "moreblocks:oerkkiblock 9",
	recipe = {
		{"default:iron_lump", "default:coal_lump", "default:iron_lump"},
		{"default:coal_lump", "default:bookshelf", "default:coal_lump"},
		{"default:iron_lump", "default:coal_lump", "default:iron_lump"},
	}
})

minetest.register_craft({
	output = "moreblocks:oerkkiblock 9",
	recipe = {
		{"default:coal_lump", "default:iron_lump", "default:coal_lump"},
		{"default:iron_lump", "default:bookshelf", "default:iron_lump"},
		{"default:coal_lump", "default:iron_lump", "default:coal_lump"},
	}
})

minetest.register_craft({
	output = "sapling 1",
	recipe = {
		{"default:leaves", "default:leaves", "default:leaves"},
		{"default:leaves", "default:leaves", "default:leaves"},
		{"", "default:stick", ""},
	}
})

minetest.register_craft({
	output = "moreblocks:rope 1",
	recipe = {
		{"default:leaves"},
		{"default:leaves"},
		{"default:leaves"},
	}
})

minetest.register_craft({
	output = "moreblocks:rope 1",
	recipe = {
		{"default:leaves"},
		{"default:junglegrass"},
		{"default:leaves"},
	}
})

minetest.register_craft({
	output = "moreblocks:rope 1",
	recipe = {
		{"default:junglegrass"},
		{"default:junglegrass"},
		{"default:junglegrass"},
	}
})

minetest.register_craft({
	output = "moreblocks:rope 1",
	recipe = {
		{"default:junglegrass"},
		{"default:leaves"},
		{"default:junglegrass"},
	}
})

minetest.register_craft({
	output = "moreblocks:horizontaltree 2",
	recipe = {
		{"default:tree","","default:tree"},
	}
})

minetest.register_craft({
	output = "default:tree 2",
	recipe = {
		{"moreblocks:horizontaltree"},
		{"moreblocks:horizontaltree"},
	}
})

minetest.register_craft({
	output = "moreblocks:horizontaljungletree 2",
	recipe = {
		{"default:jungletree","","default:jungletree"},
	}
})

minetest.register_craft({
	output = "jungletree 2",
	recipe = {
		{"moreblocks:horizontaljungletree"},
		{"moreblocks:horizontaljungletree"},
	}
})
