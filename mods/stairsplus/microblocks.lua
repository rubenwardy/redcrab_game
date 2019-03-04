-- Load translation library if intllib is installed

local S
if (minetest.get_modpath("intllib")) then
	dofile(minetest.get_modpath("intllib").."/intllib.lua")
	S = intllib.Getter(minetest.get_current_modname())
	else
	S = function ( s ) return s end
end

-- Node will be called <modname>micro_<subname>

function register_micro(modname, subname, recipeitem, groups, images, description, drop)
minetest.register_node(modname .. ":micro_" .. subname .. "_bottom", {
	description = S("%s Microblock"):format(S(description)),
	drawtype = "nodebox",
	tiles = images,
	drop = modname .. ":micro_" .. drop .. "_bottom",
	paramtype = "light",
	paramtype2 = "facedir",
	sunlight_propagates = true,
	groups = groups,
	node_box = {
		type = "fixed",
		fixed = {-0.5, -0.5, 0, 0, 0, 0.5},
	},
	selection_box = {
		type = "fixed",
		fixed = {-0.5, -0.5, 0, 0, 0, 0.5},
	},
	sounds = default.node_sound_stone_defaults(),
	on_place = function(itemstack, placer, pointed_thing)
if pointed_thing.type ~= "node" then
	return itemstack
end

local p0 = pointed_thing.under
local p1 = pointed_thing.above
if p0.y-1 == p1.y then
	local fakestack = ItemStack(modname .. ":micro_" .. subname.. "_top")
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

minetest.register_node(modname .. ":micro_" .. subname .. "_top", {
	description = S("%s Microblock"):format(S(description)),
	drawtype = "nodebox",
	tiles = images,
	drop = modname .. ":micro_" .. drop .. "_top",
	paramtype = "light",
	paramtype2 = "facedir",
	sunlight_propagates = true,
	groups = groups,
	node_box = {
		type = "fixed",
		fixed = {-0.5, 0, 0, 0, 0.5, 0.5},
	},
	selection_box = {
		type = "fixed",
		fixed = {-0.5, 0, 0, 0, 0.5, 0.5},
	},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_craft({
	output = modname .. ":micro_" .. subname .. "_bottom 8",
	recipe = {
		{"default:stick"},
		{recipeitem},
	},
})

minetest.register_craft({
	output = modname .. ":micro_" .. subname .. "_top 1",
	recipe = {
		{modname .. ":micro_" .. subname .. "_bottom"},
	},
})

minetest.register_craft({
	output = modname .. ":micro_" .. subname .. "_bottom 1",
	recipe = {
		{modname .. ":micro_" .. subname .. "_top"},
	},
})

minetest.register_craft({
	type = "cooking",
	output = modname .. ":micro_" .. subname .. "_stone_bottom",
	recipe = modname .. ":micro_" .. subname .. "_cobble_bottom",
})

minetest.register_craft({
	type = "cooking",
	output = modname .. ":micro_" .. subname .. "_stone_top",
	recipe = modname .. ":micro_" .. subname .. "_cobble_top",
})
end
