-- Load translation library if intllib is installed

local S
if (minetest.get_modpath("intllib")) then
	dofile(minetest.get_modpath("intllib").."/intllib.lua")
	S = intllib.Getter(minetest.get_current_modname())
	else
	S = function ( s ) return s end
end

-- Node will be called <modname>panel_<subname>

function register_panel(modname, subname, recipeitem, groups, images, description, drop)
minetest.register_node(modname .. ":panel_" .. subname .. "_bottom", {
	description = S("%s Panel"):format(S(description)),
	drawtype = "nodebox",
	tiles = images,
	drop = modname .. ":panel_" .. drop .. "_bottom",
	paramtype = "light",
	paramtype2 = "facedir",
	sunlight_propagates = true,
	groups = groups,
	node_box = {
		type = "fixed",
		fixed = {-0.5, -0.5, 0, 0.5, 0, 0.5},
	},
	selection_box = {
		type = "fixed",
		fixed = {-0.5, -0.5, 0, 0.5, 0, 0.5},
	},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node(modname .. ":panel_" .. subname .. "_top", {
	description = S("%s Panel"):format(S(description)),
	drawtype = "nodebox",
	tiles = images,
	drop = modname .. ":panel_" .. drop .. "_bottom",
	paramtype = "light",
	paramtype2 = "facedir",
	sunlight_propagates = true,
	groups = groups,
	node_box = {
		type = "fixed",
		fixed = {-0.5, 0, 0, 0.5, 0.5, 0.5},
	},
	selection_box = {
		type = "fixed",
		fixed = {-0.5, 0, 0, 0.5, 0.5, 0.5},
	},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node(modname .. ":panel_" .. subname .. "_vertical", {
	description = S("%s Panel"):format(S(description)),
	drawtype = "nodebox",
	tiles = images,
	drop = modname .. ":panel_" .. drop .. "_bottom",
	paramtype = "light",
	paramtype2 = "facedir",
	sunlight_propagates = true,
	groups = groups,
	node_box = {
		type = "fixed",
		fixed = {-0.5, -0.5, 0, 0, 0.5, 0.5},
	},
	selection_box = {
		type = "fixed",
		fixed = {-0.5, -0.5, 0, 0, 0.5, 0.5},
	},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_craft({
	output = modname .. ":panel_" .. subname .. "_bottom 8",
	recipe = {
		{recipeitem, recipeitem},
	},
})

minetest.register_craft({
	output = modname .. ":panel_" .. subname .. "_vertical 8",
	recipe = {
		{recipeitem},
		{recipeitem},
	},
})

minetest.register_craft({
	output = modname .. ":panel_" .. subname .. "_top 1",
	recipe = {
		{modname .. ":panel_" .. subname .. "_bottom"},
	},
})

minetest.register_craft({
	output = modname .. ":panel_" .. subname .. "_bottom 1",
	recipe = {
		{modname .. ":panel_" .. subname .. "_top"},
	},
})

minetest.register_craft({
	output = modname .. ":panel_" .. subname .. "_vertical 2",
	recipe = {
		{modname .. ":panel_" .. subname .. "_bottom"},
		{modname .. ":panel_" .. subname .. "_bottom"},
	},
})

minetest.register_craft({
	output = modname .. ":panel_" .. subname .. "_bottom 2",
	recipe = {
		{modname .. ":panel_" .. subname .. "_vertical", modname .. ":panel_" .. subname .. "_vertical"},
	},
})

minetest.register_craft({
	type = "cooking",
	output = modname .. ":panel_" .. subname .. "_stone_bottom",
	recipe = modname .. ":panel_" .. subname .. "_cobble_bottom",
})

minetest.register_craft({
	type = "cooking",
	output = modname .. ":panel_" .. subname .. "_stone_top",
	recipe = modname .. ":panel_" .. subname .. "_cobble_top",
})

minetest.register_craft({
	type = "cooking",
	output = modname .. ":panel_" .. subname .. "_stone_vertical",
	recipe = modname .. ":panel_" .. subname .. "_cobble_vertical",
})
end
