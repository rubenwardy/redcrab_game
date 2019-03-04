-- Load translation library if intllib is installed

local S
if (minetest.get_modpath("intllib")) then
	dofile(minetest.get_modpath("intllib").."/intllib.lua")
	S = intllib.Getter(minetest.get_current_modname())
	else
	S = function ( s ) return s end
end

-- Node will be called <modname>:stair_<subname>

function register_stair(modname, subname, recipeitem, groups, images, description, drop)
	minetest.register_node(modname .. ":stair_" .. subname, {
	description = S("%s Stairs"):format(S(description)),
	drawtype = "nodebox",
	tiles = images,
	paramtype = "light",
	paramtype2 = "facedir",
	sunlight_propagates = true,
	groups = groups,
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, 0, 0.5},
			{-0.5, 0, 0, 0.5, 0.5, 0.5},
		},
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, 0, 0.5},
			{-0.5, 0, 0, 0.5, 0.5, 0.5},
		},
	},
	sounds = default.node_sound_stone_defaults(),
	on_place = function(itemstack, placer, pointed_thing)
if pointed_thing.type ~= "node" then
	return itemstack
end

local p0 = pointed_thing.under
local p1 = pointed_thing.above
if p0.y-1 == p1.y then
	local fakestack = ItemStack(modname .. ":stair_" .. subname.. "_inverted")
	local ret = minetest.item_place(fakestack, placer, pointed_thing)
	if ret:is_empty() then
		itemstack:take_item()
		return itemstack
	end
end

-- Otherwise place regularly
return minetest.item_place(itemstack, placer, pointed_thing)
end,
})

	minetest.register_node(":stairs:stair_" .. subname, {
	description = S("%s Stairs"):format(S(description)),
	drawtype = "nodebox",
	tiles = images,
	paramtype = "light",
	paramtype2 = "facedir",
	sunlight_propagates = true,
	groups = {cracky=3, not_in_creative_inventory=1},
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, 0, 0.5},
			{-0.5, 0, 0, 0.5, 0.5, 0.5},
		},
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, 0, 0.5},
			{-0.5, 0, 0, 0.5, 0.5, 0.5},
		},
	},
	sounds = default.node_sound_stone_defaults(),
})

	minetest.register_node(modname .. ":stair_" .. subname .. "_inverted", {
	description = S("%s Stairs"):format(S(description)),
	drawtype = "nodebox",
	tiles = images,
	drop = modname .. ":stair_" .. drop,
	paramtype = "light",
	paramtype2 = "facedir",
	sunlight_propagates = true,
	groups = groups,
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, 0, -0.5, 0.5, 0.5, 0.5},
			{-0.5, -0.5, 0, 0.5, 0, 0.5},
		},
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.5, 0, -0.5, 0.5, 0.5, 0.5},
			{-0.5, -0.5, 0, 0.5, 0, 0.5},
		},
	},
	sounds = default.node_sound_stone_defaults(),
})

	minetest.register_node(modname .. ":stair_" .. subname .. "_half", {
	description = S("%s Stairs"):format(S(description)),
	drawtype = "nodebox",
	tiles = images,
	paramtype = "light",
	paramtype2 = "facedir",
	sunlight_propagates = true,
	groups = groups,
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0, 0, 0.5},
			{-0.5, 0, 0, 0, 0.5, 0.5},
		},
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0, 0, 0.5},
			{-0.5, 0, 0, 0, 0.5, 0.5},
		},
	},
	sounds = default.node_sound_stone_defaults(),
	on_place = function(itemstack, placer, pointed_thing)
if pointed_thing.type ~= "node" then
	return itemstack
end

local p0 = pointed_thing.under
local p1 = pointed_thing.above
if p0.y-1 == p1.y then
	local fakestack = ItemStack(modname .. ":stair_" .. subname.. "_half_inverted")
	local ret = minetest.item_place(fakestack, placer, pointed_thing)
	if ret:is_empty() then
		itemstack:take_item()
		return itemstack
	end
end

-- Otherwise place regularly
return minetest.item_place(itemstack, placer, pointed_thing)
end,
})

	minetest.register_node(modname .. ":stair_" .. subname .. "_half_inverted", {
	description = S("%s Stairs"):format(S(description)),
	drawtype = "nodebox",
	tiles = images,
	paramtype = "light",
	paramtype2 = "facedir",
	sunlight_propagates = true,
	groups = groups,
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, 0, -0.5, 0, 0.5, 0.5},
			{-0.5, -0.5, 0, 0, 0, 0.5},
		},
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.5, 0, -0.5, 0, 0.5, 0.5},
			{-0.5, -0.5, 0, 0, 0, 0.5},
		},
	},
	sounds = default.node_sound_stone_defaults(),
})

	minetest.register_node(modname .. ":stair_" .. subname .. "_right_half", {
	description = S("%s Stairs"):format(S(description)),
	drawtype = "nodebox",
	tiles = images,
	paramtype = "light",
	paramtype2 = "facedir",
	sunlight_propagates = true,
	groups = groups,
	node_box = {
		type = "fixed",
		fixed = {
			{0, -0.5, -0.5, 0.5, 0, 0.5},
			{0, 0, 0, 0.5, 0.5, 0.5},
		},
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{0, -0.5, -0.5, 0.5, 0, 0.5},
			{0, 0, 0, 0.5, 0.5, 0.5},
		},
	},
	sounds = default.node_sound_stone_defaults(),
	on_place = function(itemstack, placer, pointed_thing)
if pointed_thing.type ~= "node" then
	return itemstack
end

local p0 = pointed_thing.under
local p1 = pointed_thing.above
if p0.y-1 == p1.y then
	local fakestack = ItemStack(modname .. ":stair_" .. subname.. "_right_half_inverted")
	local ret = minetest.item_place(fakestack, placer, pointed_thing)
	if ret:is_empty() then
		itemstack:take_item()
		return itemstack
	end
end

-- Otherwise place regularly
return minetest.item_place(itemstack, placer, pointed_thing)
end,
})

	minetest.register_node(modname .. ":stair_" .. subname .. "_right_half_inverted", {
	description = S("%s Stairs"):format(S(description)),
	drawtype = "nodebox",
	tiles = images,
	paramtype = "light",
	paramtype2 = "facedir",
	sunlight_propagates = true,
	groups = groups,
	node_box = {
		type = "fixed",
		fixed = {
			{0, 0, -0.5, 0.5, 0.5, 0.5},
			{0, -0.5, 0, 0.5, 0, 0.5},
		},
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{0, 0, -0.5, 0.5, 0.5, 0.5},
			{0, -0.5, 0, 0.5, 0, 0.5},
		},
	},
	sounds = default.node_sound_stone_defaults(),
})

	minetest.register_node(modname .. ":stair_" .. subname .. "_wall", {
	description = S("%s Stairs"):format(S(description)),
	drawtype = "nodebox",
	tiles = images,
	drop = modname .. ":stair_" .. drop,
	paramtype = "light",
	paramtype2 = "facedir",
	sunlight_propagates = true,
	groups = groups,
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, 0, 0.5, 0.5, 0.5},
			{-0.5, -0.5, -0.5, 0, 0.5, 0},
		},
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, 0, 0.5, 0.5, 0.5},
			{-0.5, -0.5, -0.5, 0, 0.5, 0},
		},
	},
	sounds = default.node_sound_stone_defaults(),
})

	minetest.register_node(modname .. ":stair_" .. subname .. "_wall_half", {
	description = S("%s Stairs"):format(S(description)),
	drawtype = "nodebox",
	tiles = images,
	drop = modname .. ":stair_" .. drop .. "_wall_half",
	paramtype = "light",
	paramtype2 = "facedir",
	sunlight_propagates = true,
	groups = groups,
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, 0, 0.5, 0, 0.5},
			{-0.5, -0.5, -0.5, 0, 0, 0},
		},
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, 0, 0.5, 0, 0.5},
			{-0.5, -0.5, -0.5, 0, 0, 0},
		},
	},
	sounds = default.node_sound_stone_defaults(),
	on_place = function(itemstack, placer, pointed_thing)
if pointed_thing.type ~= "node" then
	return itemstack
end

local p0 = pointed_thing.under
local p1 = pointed_thing.above
if p0.y-1 == p1.y then
	local fakestack = ItemStack(modname .. ":stair_" .. subname.. "_wall_half_inverted")
	local ret = minetest.item_place(fakestack, placer, pointed_thing)
	if ret:is_empty() then
		itemstack:take_item()
		return itemstack
	end
end

-- Otherwise place regularly
return minetest.item_place(itemstack, placer, pointed_thing)
end,
})

	minetest.register_node(modname .. ":stair_" .. subname .. "_wall_half_inverted", {
	description = S("%s Stairs"):format(S(description)),
	drawtype = "nodebox",
	tiles = images,
	drop = modname .. ":stair_" .. drop .. "_wall_half",
	paramtype = "light",
	paramtype2 = "facedir",
	sunlight_propagates = true,
	sunlight_propagates = true,
	groups = groups,
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, 0, 0, 0.5, 0.5, 0.5},
			{-0.5, 0, -0.5, 0, 0.5, 0},
		},
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.5, 0, 0, 0.5, 0.5, 0.5},
			{-0.5, 0, -0.5, 0, 0.5, 0},
		},
	},
	sounds = default.node_sound_stone_defaults(),
})

	minetest.register_node(modname .. ":stair_" .. subname .. "_inner", {
	description = S("%s Stairs"):format(S(description)),
	drawtype = "nodebox",
	tiles = images,
	drop = modname .. ":stair_" .. drop .. "_inner",
	paramtype = "light",
	paramtype2 = "facedir",
	sunlight_propagates = true,
	groups = groups,
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, 0, 0.5},
			{-0.5, 0, 0, 0.5, 0.5, 0.5},
			{-0.5, 0, -0.5, 0, 0.5, 0},
		},
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, 0, 0.5},
			{-0.5, 0, 0, 0.5, 0.5, 0.5},
			{-0.5, 0, -0.5, 0, 0.5, 0},
		},
	},
	sounds = default.node_sound_stone_defaults(),
	on_place = function(itemstack, placer, pointed_thing)
if pointed_thing.type ~= "node" then
	return itemstack
end

local p0 = pointed_thing.under
local p1 = pointed_thing.above
if p0.y-1 == p1.y then
	local fakestack = ItemStack(modname .. ":stair_" .. subname.. "_inner_inverted")
	local ret = minetest.item_place(fakestack, placer, pointed_thing)
	if ret:is_empty() then
		itemstack:take_item()
		return itemstack
	end
end

-- Otherwise place regularly
return minetest.item_place(itemstack, placer, pointed_thing)
end,
})

	minetest.register_node(modname .. ":stair_" .. subname .. "_outer", {
	description = S("%s Stairs"):format(S(description)),
	drawtype = "nodebox",
	tiles = images,
	drop = modname .. ":stair_" .. drop .. "_outer",
	paramtype = "light",
	paramtype2 = "facedir",
	sunlight_propagates = true,
	groups = groups,
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, 0, 0.5},
			{-0.5, 0, 0, 0, 0.5, 0.5},
		},
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, 0, 0.5},
			{-0.5, 0, 0, 0, 0.5, 0.5},
		},
	},
	sounds = default.node_sound_stone_defaults(),
	on_place = function(itemstack, placer, pointed_thing)
if pointed_thing.type ~= "node" then
	return itemstack
end

local p0 = pointed_thing.under
local p1 = pointed_thing.above
if p0.y-1 == p1.y then
	local fakestack = ItemStack(modname .. ":stair_" .. subname.. "_outer_inverted")
	local ret = minetest.item_place(fakestack, placer, pointed_thing)
	if ret:is_empty() then
		itemstack:take_item()
		return itemstack
	end
end

-- Otherwise place regularly
return minetest.item_place(itemstack, placer, pointed_thing)
end,
})

	minetest.register_node(modname .. ":stair_" .. subname .. "_inner_inverted", {
	description = S("%s Stairs"):format(S(description)),
	drawtype = "nodebox",
	tiles = images,
	drop = modname .. ":stair_" .. drop .. "_inner",
	paramtype = "light",
	paramtype2 = "facedir",
	sunlight_propagates = true,
	groups = groups,
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, 0, -0.5, 0.5, 0.5, 0.5},
			{-0.5, -0.5, 0, 0.5, 0, 0.5},
			{-0.5, -0.5, -0.5, 0, 0, 0},
		},
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.5, 0, -0.5, 0.5, 0.5, 0.5},
			{-0.5, -0.5, 0, 0.5, 0, 0.5},
			{-0.5, -0.5, -0.5, 0, 0, 0},
		},
	},
	sounds = default.node_sound_stone_defaults(),
})

	minetest.register_node(modname .. ":stair_" .. subname .. "_outer_inverted", {
	description = S("%s Stairs"):format(S(description)),
	drawtype = "nodebox",
	tiles = images,
	drop = modname .. ":stair_" .. drop .. "_outer",
	paramtype = "light",
	paramtype2 = "facedir",
	sunlight_propagates = true,
	groups = groups,
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, 0, -0.5, 0.5, 0.5, 0.5},
			{-0.5, -0.5, 0, 0, 0, 0.5},
		},
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.5, 0, -0.5, 0.5, 0.5, 0.5},
			{-0.5, -0.5, 0, 0, 0, 0.5},
		},
	},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_craft({
	output = modname .. ":stair_" .. subname .. " 8",
	recipe = {
		{recipeitem, "", ""},
		{recipeitem, recipeitem, ""},
		{recipeitem, recipeitem, recipeitem},
	},
})

minetest.register_craft({
	output = modname .. ":stair_" .. subname .. " 8",
	recipe = {
		{"", "", recipeitem},
		{"", recipeitem, recipeitem},
		{recipeitem, recipeitem, recipeitem},
	},
})

minetest.register_craft({
	output = modname .. ":stair_" .. subname .. "_wall 8",
	recipe = {
		{recipeitem, recipeitem, recipeitem},
		{recipeitem, recipeitem, ""},
		{recipeitem, "", ""},
	},
})

minetest.register_craft({
	output = modname .. ":stair_" .. subname .. "_wall 8",
	recipe = {
		{recipeitem, recipeitem, recipeitem},
		{"", recipeitem, recipeitem},
		{"", "", recipeitem},
	},
})

minetest.register_craft({
	output = modname .. ":stair_" .. subname .. "_wall 2",
	recipe = {
		{modname .. ":stair_" .. subname, modname .. ":stair_" .. subname},
	},
})

minetest.register_craft({
	output = modname .. ":stair_" .. subname .. "_wall 2",
	recipe = {
		{modname .. ":stair_" .. subname .. "_inverted", modname .. ":stair_" .. subname .. "_inverted"},
	},
})

minetest.register_craft({
	output = modname .. ":stair_" .. subname .. " 2",
	recipe = {
		{modname .. ":stair_" .. subname .. "_wall"},
		{modname .. ":stair_" .. subname .. "_wall"},
	},
})

minetest.register_craft({
	output = modname .. ":stair_" .. subname .. "_inner 1",
	recipe = {
		{modname .. ":micro_" .. subname .. "_bottom", modname .. ":stair_" .. subname},
	},
})

minetest.register_craft({
	output = modname .. ":stair_" .. subname .. "_inner 1",
	recipe = {
		{modname .. ":stair_" .. subname .. "_wall_half"},
		{modname .. ":slab_" .. subname},
	},
})

minetest.register_craft({
	output = modname .. ":stair_" .. subname .. "_outer 1",
	recipe = {
		{modname .. ":micro_" .. subname .. "_bottom"},
		{modname .. ":slab_" .. subname},
	},
})

minetest.register_craft({
	output = modname .. ":stair_" .. subname .. "_half 1",
	recipe = {
		{modname .. ":micro_" .. subname .. "_bottom"},
		{modname .. ":panel_" .. subname .. "_bottom"},
	},
})

minetest.register_craft({
	output = modname .. ":stair_" .. subname .. "_half_inverted 1",
	recipe = {
		{modname .. ":stair_" .. subname .. "_half 1"},
	},
})

minetest.register_craft({
	output = modname .. ":stair_" .. subname .. "_half 1",
	recipe = {
		{modname .. ":stair_" .. subname .. "_half_inverted 1"},
	},
})

minetest.register_craft({
	output = modname .. ":stair_" .. subname .. "_right_half 2",
	recipe = {
		{modname .. ":stair_" .. subname .. "_half", modname .. ":stair_" .. subname .. "_half"},
	},
})

minetest.register_craft({
	output = modname .. ":stair_" .. subname .. "_half 2",
	recipe = {
		{modname .. ":stair_" .. subname .. "_right_half", modname .. ":stair_" .. subname .. "_right_half"},
	},
})

minetest.register_craft({
	output = modname .. ":stair_" .. subname .. "_right_half_inverted 1",
	recipe = {
		{modname .. ":stair_" .. subname .. "_right_half"},
	},
})

minetest.register_craft({
	output = modname .. ":stair_" .. subname .. "_right_half 1",
	recipe = {
		{modname .. ":stair_" .. subname .. "_right_half_inverted"},
	},
})

minetest.register_craft({
	output = modname .. ":stair_" .. subname .. "_half_inverted 2",
	recipe = {
		{modname .. ":stair_" .. subname .. "_right_half_inverted", modname .. ":stair_" .. subname .. "_right_half_inverted"},
	},
})

minetest.register_craft({
	output = modname .. ":stair_" .. subname .. "_right_half_inverted 2",
	recipe = {
		{modname .. ":stair_" .. subname .. "_half_inverted", modname .. ":stair_" .. subname .. "_half_inverted"},
	},
})

minetest.register_craft({
	output = modname .. ":stair_" .. subname .. "_inner_inverted 1",
	recipe = {
		{modname .. ":stair_" .. subname .. "_inner"},
	},
})

minetest.register_craft({
	output = modname .. ":stair_" .. subname .. "_outer_inverted 1",
	recipe = {
		{modname .. ":stair_" .. subname .. "_outer"},
	},
})

minetest.register_craft({
	output = modname .. ":stair_" .. subname .. "_inner 1",
	recipe = {
		{modname .. ":stair_" .. subname .. "_inner_inverted"},
	},
})

minetest.register_craft({
	output = modname .. ":stair_" .. subname .. "_outer 1",
	recipe = {
		{modname .. ":stair_" .. subname .. "_outer_inverted"},
	},
})

minetest.register_craft({
	output = modname .. ":stair_" .. subname .. "_wall_half 2",
	recipe = {
		{modname .. ":stair_" .. subname .. "_wall"},
	},
})

minetest.register_craft({
	output = modname .. ":stair_" .. subname .. "_wall 1",
	recipe = {
		{modname .. ":stair_" .. subname .. "_wall_half"},
		{modname .. ":stair_" .. subname .. "_wall_half"},
	},
})

minetest.register_craft({
	output = modname .. ":stair_" .. subname .. "_wall_half_inverted 1",
	recipe = {
		{modname .. ":stair_" .. subname .. "_wall_half"},
	},
})

minetest.register_craft({
	output = modname .. ":stair_" .. subname .. "_wall_half 1",
	recipe = {
		{modname .. ":stair_" .. subname .. "_wall_half_inverted"},
	},
})

minetest.register_craft({
	output = modname .. ":stair_" .. subname .. "_inverted 1",
	recipe = {
		{modname .. ":stair_" .. subname},
	},
})

minetest.register_craft({
	output = modname .. ":stair_" .. subname .. " 1",
	recipe = {
		{modname .. ":stair_" .. subname .. "_inverted"},
	},
})

minetest.register_craft({
	type = "cooking",
	output = modname .. ":stair_" .. subname .. "_stone",
	recipe = modname .. ":stair_" .. subname .. "_cobble",
})

minetest.register_craft({
	type = "cooking",
	output = modname .. ":stair_" .. subname .. "_stone_wall",
	recipe = modname .. ":stair_" .. subname .. "_cobble_wall",
})

minetest.register_craft({
	type = "cooking",
	output = modname .. ":stair_" .. subname .. "_stone_wall_half",
	recipe = modname .. ":stair_" .. subname .. "_cobble_wall_half",
})

end
