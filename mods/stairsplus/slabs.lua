-- Load translation library if intllib is installed

local S
if (minetest.get_modpath("intllib")) then
	dofile(minetest.get_modpath("intllib").."/intllib.lua")
	S = intllib.Getter(minetest.get_current_modname())
	else
	S = function ( s ) return s end
end

-- Node will be called <modname>slab_<subname>

function register_slab(modname, subname, recipeitem, groups, images, description, drop, paramtype2)
minetest.register_node(modname .. ":slab_" .. subname, {
	description = S("%s Slab"):format(S(description)),
	drawtype = "nodebox",
	tiles = images,
	drop = modname .. ":slab_" .. drop,
	paramtype = "light",
	paramtype2 = paramtype2,
	sunlight_propagates = true,
	groups = groups,
	node_box = {
		type = "fixed",
		fixed = {-0.5, -0.5, -0.5, 0.5, 0, 0.5},
	},
	selection_box = {
		type = "fixed",
		fixed = {-0.5, -0.5, -0.5, 0.5, 0, 0.5},
	},
	sounds = default.node_sound_stone_defaults(),
	on_place = function(itemstack, placer, pointed_thing)
		if pointed_thing.type ~= "node" then
			return itemstack
		end

		-- If it's being placed on an another similar one, replace it with
		-- a full block
		local slabpos = nil
		local slabnode = nil
		local p1 = pointed_thing.above
		p1 = {x = p1.x, y = p1.y - 1, z = p1.z}
		local n1 = minetest.env:get_node(p1)
		if n1.name == modname .. ":slab_" .. subname then
			slabpos = p1
			slabnode = n1
		end
		if slabpos then
			-- Remove the slab at slabpos
			minetest.env:remove_node(slabpos)
			-- Make a fake stack of a single item and try to place it
			local fakestack = ItemStack(recipeitem)
			pointed_thing.above = slabpos
			fakestack = minetest.item_place(fakestack, placer, pointed_thing)
			-- If the item was taken from the fake stack, decrement original
			if not fakestack or fakestack:is_empty() then
				itemstack:take_item(1)
			-- Else put old node back
			else
				minetest.env:set_node(slabpos, slabnode)
			end
			return itemstack
		end
		
		if n1.name == modname .. ":slab_" .. subname .. "_quarter" then
			slabpos = p1
			slabnode = n1
		end
		if slabpos then
			-- Remove the slab at slabpos
			minetest.env:remove_node(slabpos)
			-- Make a fake stack of a single item and try to place it
			local fakestack = ItemStack(modname .. ":slab_" .. subname .. "_three_quarter")
			pointed_thing.above = slabpos
			fakestack = minetest.item_place(fakestack, placer, pointed_thing)
			-- If the item was taken from the fake stack, decrement original
			if not fakestack or fakestack:is_empty() then
				itemstack:take_item(1)
			-- Else put old node back
			else
				minetest.env:set_node(slabpos, slabnode)
			end
			return itemstack
		end

		-- Otherwise place regularly
		return minetest.item_place(itemstack, placer, pointed_thing)
	end,
})

minetest.register_node(":stairs:slab_" .. subname, {
	description = S("%s Slab"):format(S(description)),
	drawtype = "nodebox",
	tiles = images,
	drop = modname .. ":slab_" .. drop,
	paramtype = "light",
	sunlight_propagates = true,
	groups = groups,
	node_box = {
		type = "fixed",
		fixed = {-0.5, -0.5, -0.5, 0.5, 0, 0.5},
	},
	selection_box = {
		type = "fixed",
		fixed = {-0.5, -0.5, -0.5, 0.5, 0, 0.5},
	},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node(modname .. ":slab_" .. subname .. "_inverted", {
	description = S("%s Slab"):format(S(description)),
	drawtype = "nodebox",
	tiles = images,
	drop = modname .. ":slab_" .. drop .. "_inverted",
	paramtype = "light",
	paramtype2 = paramtype2,
	sunlight_propagates = true,
	groups = groups,
	node_box = {
		type = "fixed",
		fixed = {-0.5, 0, -0.5, 0.5, 0.5, 0.5},
	},
	selection_box = {
		type = "fixed",
		fixed = {-0.5, 0, -0.5, 0.5, 0.5, 0.5},
	},
	sounds = default.node_sound_stone_defaults(),
	on_place = function(itemstack, placer, pointed_thing)
		if pointed_thing.type ~= "node" then
			return itemstack
		end

		-- If it's being placed on an another similar one, replace it with
		-- a full block
		local slabpos = nil
		local slabnode = nil
		local p1 = pointed_thing.above
		p1 = {x = p1.x, y = p1.y + 1, z = p1.z}
		local n1 = minetest.env:get_node(p1)
		if n1.name == modname .. ":slab_" .. subname .. "_inverted" then
			slabpos = p1
			slabnode = n1
		end
		if slabpos then
			-- Remove the slab at slabpos
			minetest.env:remove_node(slabpos)
			-- Make a fake stack of a single item and try to place it
			local fakestack = ItemStack(recipeitem)
			pointed_thing.above = slabpos
			fakestack = minetest.item_place(fakestack, placer, pointed_thing)
			-- If the item was taken from the fake stack, decrement original
			if not fakestack or fakestack:is_empty() then
				itemstack:take_item(1)
			-- Else put old node back
			else
				minetest.env:set_node(slabpos, slabnode)
			end
			return itemstack
		end
		
		if n1.name == modname .. ":slab_" .. subname .. "_quarter_inverted" then
			slabpos = p1
			slabnode = n1
		end
		if slabpos then
			-- Remove the slab at slabpos
			minetest.env:remove_node(slabpos)
			-- Make a fake stack of a single item and try to place it
			local fakestack = ItemStack(modname .. ":slab_" .. subname .. "_three_quarter_inverted")
			pointed_thing.above = slabpos
			fakestack = minetest.item_place(fakestack, placer, pointed_thing)
			-- If the item was taken from the fake stack, decrement original
			if not fakestack or fakestack:is_empty() then
				itemstack:take_item(1)
			-- Else put old node back
			else
				minetest.env:set_node(slabpos, slabnode)
			end
			return itemstack
		end

		-- Otherwise place regularly
		return minetest.item_place(itemstack, placer, pointed_thing)
	end,
})

minetest.register_node(modname .. ":slab_" .. subname .. "_wall", {
	description = S("%s Slab"):format(S(description)),
	drawtype = "nodebox",
	tiles = images,
	drop = modname .. ":slab_" .. drop .. "_wall",
	paramtype = "light",
	paramtype2 = "facedir",
	sunlight_propagates = true,
	groups = groups,
	node_box = {
		type = "fixed",
		fixed = {-0.5, -0.5, 0, 0.5, 0.5, 0.5},
	},
	selection_box = {
		type = "fixed",
		fixed = {-0.5, -0.5, 0, 0.5, 0.5, 0.5},
	},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node(modname .. ":slab_" .. subname .. "_quarter_wall", {
	description = S("%s Slab"):format(S(description)),
	drawtype = "nodebox",
	tiles = images,
	drop = modname .. ":slab_" .. drop .. "_quarter_wall",
	paramtype = "light",
	paramtype2 = "facedir",
	sunlight_propagates = true,
	groups = groups,
	node_box = {
		type = "fixed",
		fixed = {-0.5, -0.5, 0.25, 0.5, 0.5, 0.5},
	},
	selection_box = {
		type = "fixed",
		fixed = {-0.5, -0.5, 0.25, 0.5, 0.5, 0.5},
	},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node(modname .. ":slab_" .. subname .. "_three_quarter_wall", {
	description = S("%s Slab"):format(S(description)),
	drawtype = "nodebox",
	tiles = images,
	drop = modname .. ":slab_" .. drop .. "_three_quarter_wall",
	paramtype = "light",
	paramtype2 = "facedir",
	sunlight_propagates = true,
	groups = groups,
	node_box = {
		type = "fixed",
		fixed = {-0.5, -0.5, -0.25, 0.5, 0.5, 0.5},
	},
	selection_box = {
		type = "fixed",
		fixed = {-0.5, -0.5, -0.25, 0.5, 0.5, 0.5},
	},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node(modname .. ":slab_" .. subname .. "_quarter", {
	description = S("%s Slab"):format(S(description)),
	drawtype = "nodebox",
	tiles = images,
	drop = modname .. ":slab_" .. drop .. "_quarter",
	paramtype = "light",
	paramtype2 = paramtype2,
	sunlight_propagates = true,
	groups = groups,
	node_box = {
		type = "fixed",
		fixed = {-0.5, -0.5, -0.5, 0.5, -0.25, 0.5},
	},
	selection_box = {
		type = "fixed",
		fixed = {-0.5, -0.5, -0.5, 0.5, -0.25, 0.5},
	},
	sounds = default.node_sound_stone_defaults(),
	on_place = function(itemstack, placer, pointed_thing)
		if pointed_thing.type ~= "node" then
			return itemstack
		end

		-- If it's being placed on an another similar one, replace it with
		-- a full block
		local slabpos = nil
		local slabnode = nil
		local p1 = pointed_thing.above
		p1 = {x = p1.x, y = p1.y - 1, z = p1.z}
		local n1 = minetest.env:get_node(p1)
		if n1.name == modname .. ":slab_" .. subname .. "_quarter" then
			slabpos = p1
			slabnode = n1
		end
		if slabpos then
			-- Remove the slab at slabpos
			minetest.env:remove_node(slabpos)
			-- Make a fake stack of a single item and try to place it
			local fakestack = ItemStack(modname .. ":slab_" .. subname)
			pointed_thing.above = slabpos
			fakestack = minetest.item_place(fakestack, placer, pointed_thing)
			-- If the item was taken from the fake stack, decrement original
			if not fakestack or fakestack:is_empty() then
				itemstack:take_item(1)
			-- Else put old node back
			else
				minetest.env:set_node(slabpos, slabnode)
			end
			return itemstack
		end
		
		if n1.name == modname .. ":slab_" .. subname then
			slabpos = p1
			slabnode = n1
		end
		if slabpos then
			-- Remove the slab at slabpos
			minetest.env:remove_node(slabpos)
			-- Make a fake stack of a single item and try to place it
			local fakestack = ItemStack(modname .. ":slab_" .. subname .. "_three_quarter")
			pointed_thing.above = slabpos
			fakestack = minetest.item_place(fakestack, placer, pointed_thing)
			-- If the item was taken from the fake stack, decrement original
			if not fakestack or fakestack:is_empty() then
				itemstack:take_item(1)
			-- Else put old node back
			else
				minetest.env:set_node(slabpos, slabnode)
			end
			return itemstack
		end
		
		if n1.name == modname .. ":slab_" .. subname .. "_three_quarter" then
			slabpos = p1
			slabnode = n1
		end
		if slabpos then
			-- Remove the slab at slabpos
			minetest.env:remove_node(slabpos)
			-- Make a fake stack of a single item and try to place it
			local fakestack = ItemStack(recipeitem)
			pointed_thing.above = slabpos
			fakestack = minetest.item_place(fakestack, placer, pointed_thing)
			-- If the item was taken from the fake stack, decrement original
			if not fakestack or fakestack:is_empty() then
				itemstack:take_item(1)
			-- Else put old node back
			else
				minetest.env:set_node(slabpos, slabnode)
			end
			return itemstack
		end

		-- Otherwise place regularly
		return minetest.item_place(itemstack, placer, pointed_thing)
	end,
})

minetest.register_node(modname .. ":slab_" .. subname .. "_quarter_inverted", {
	description = S("%s Slab"):format(S(description)),
	drawtype = "nodebox",
	tiles = images,
	drop = modname .. ":slab_" .. drop .. "_quarter",
	paramtype = "light",
	paramtype2 = paramtype2,
	sunlight_propagates = true,
	groups = groups,
	node_box = {
		type = "fixed",
		fixed = {-0.5, 0.25, -0.5, 0.5, 0.5, 0.5},
	},
	selection_box = {
		type = "fixed",
		fixed = {-0.5, 0.25, -0.5, 0.5, 0.5, 0.5},
	},
	sounds = default.node_sound_stone_defaults(),
	on_place = function(itemstack, placer, pointed_thing)
		if pointed_thing.type ~= "node" then
			return itemstack
		end

		-- If it's being placed on an another similar one, replace it with
		-- a full block
		local slabpos = nil
		local slabnode = nil
		local p1 = pointed_thing.above
		p1 = {x = p1.x, y = p1.y + 1, z = p1.z}
		local n1 = minetest.env:get_node(p1)
		if n1.name == modname .. ":slab_" .. subname .. "_quarter_inverted" then
			slabpos = p1
			slabnode = n1
		end
		if slabpos then
			-- Remove the slab at slabpos
			minetest.env:remove_node(slabpos)
			-- Make a fake stack of a single item and try to place it
			local fakestack = ItemStack(modname .. ":slab_" .. subname .. "_inverted")
			pointed_thing.above = slabpos
			fakestack = minetest.item_place(fakestack, placer, pointed_thing)
			-- If the item was taken from the fake stack, decrement original
			if not fakestack or fakestack:is_empty() then
				itemstack:take_item(1)
			-- Else put old node back
			else
				minetest.env:set_node(slabpos, slabnode)
			end
			return itemstack
		end
		
		if n1.name == modname .. ":slab_" .. subname .. "_inverted" then
			slabpos = p1
			slabnode = n1
		end
		if slabpos then
			-- Remove the slab at slabpos
			minetest.env:remove_node(slabpos)
			-- Make a fake stack of a single item and try to place it
			local fakestack = ItemStack(modname .. ":slab_" .. subname .. "_three_quarter_inverted")
			pointed_thing.above = slabpos
			fakestack = minetest.item_place(fakestack, placer, pointed_thing)
			-- If the item was taken from the fake stack, decrement original
			if not fakestack or fakestack:is_empty() then
				itemstack:take_item(1)
			-- Else put old node back
			else
				minetest.env:set_node(slabpos, slabnode)
			end
			return itemstack
		end
		
		if n1.name == modname .. ":slab_" .. subname .. "_three_quarter_inverted" then
			slabpos = p1
			slabnode = n1
		end
		if slabpos then
			-- Remove the slab at slabpos
			minetest.env:remove_node(slabpos)
			-- Make a fake stack of a single item and try to place it
			local fakestack = ItemStack(recipeitem)
			pointed_thing.above = slabpos
			fakestack = minetest.item_place(fakestack, placer, pointed_thing)
			-- If the item was taken from the fake stack, decrement original
			if not fakestack or fakestack:is_empty() then
				itemstack:take_item(1)
			-- Else put old node back
			else
				minetest.env:set_node(slabpos, slabnode)
			end
			return itemstack
		end

		-- Otherwise place regularly
		return minetest.item_place(itemstack, placer, pointed_thing)
	end,
})

minetest.register_node(modname .. ":slab_" .. subname .. "_three_quarter", {
	description = S("%s Slab"):format(S(description)),
	drawtype = "nodebox",
	tiles = images,
	drop = modname .. ":slab_" .. drop .. "_three_quarter",
	paramtype = "light",
	paramtype2 = paramtype2,
	sunlight_propagates = true,
	groups = groups,
	node_box = {
		type = "fixed",
		fixed = {-0.5, -0.5, -0.5, 0.5, 0.25, 0.5},
	},
	selection_box = {
		type = "fixed",
		fixed = {-0.5, -0.5, -0.5, 0.5, 0.25, 0.5},
	},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node(modname .. ":slab_" .. subname .. "_three_quarter_inverted", {
	description = S("%s Slab"):format(S(description)),
	drawtype = "nodebox",
	tiles = images,
	drop = modname .. ":slab_" .. drop .. "_three_quarter",
	paramtype = "light",
	paramtype2 = paramtype2,
	sunlight_propagates = true,
	groups = groups,
	node_box = {
		type = "fixed",
		fixed = {-0.5, -0.25, -0.5, 0.5, 0.5, 0.5},
	},
	selection_box = {
		type = "fixed",
		fixed = {-0.5, -0.25, -0.5, 0.5, 0.5, 0.5},
	},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_craft({
	output = modname .. ":slab_" .. subname .. " 6",
	recipe = {
		{recipeitem, recipeitem, recipeitem},
	},
})

minetest.register_craft({
	output = modname .. ":slab_" .. subname .. "_wall 6",
	recipe = {
		{recipeitem},
		{recipeitem},
		{recipeitem},
	},
})

minetest.register_craft({
	output = modname .. ":slab_" .. subname .. "_inverted 1",
	recipe = {
		{modname .. ":slab_" .. subname},
	},
})

minetest.register_craft({
	output = modname .. ":slab_" .. subname .. " 1",
	recipe = {
		{modname .. ":slab_" .. subname .. "_inverted"},
	},
})

minetest.register_craft({
	output = recipeitem,
	recipe = {
		{modname .. ":slab_" .. subname},
		{modname .. ":slab_" .. subname},
	},
})

minetest.register_craft({
	output = recipeitem,
	recipe = {
		{modname .. ":slab_" .. subname .. "_inverted"},
		{modname .. ":slab_" .. subname .. "_inverted"},
	},
})

minetest.register_craft({
	output = recipeitem,
	recipe = {
		{modname .. ":slab_" .. subname .. "_wall", modname .. ":slab_" .. subname .. "_wall"},
	},
})

minetest.register_craft({
	output = recipeitem,
	recipe = {
		{modname .. ":slab_" .. subname},
		{modname .. ":slab_" .. subname},
	},
})

minetest.register_craft({
	output = modname .. ":slab_" .. subname .. "_quarter 6",
	recipe = {
		{modname .. ":slab_" .. subname, modname .. ":slab_" .. subname, modname .. ":slab_" .. subname},
	},
})

minetest.register_craft({
	output = modname .. ":slab_" .. subname .. "_quarter_inverted 1",
	recipe = {
		{modname .. ":slab_" .. subname .. "_quarter"},
	},
})

minetest.register_craft({
	output = modname .. ":slab_" .. subname .. "_quarter 1",
	recipe = {
		{modname .. ":slab_" .. subname .. "_quarter_inverted"},
	},
})

minetest.register_craft({
	output = modname .. ":slab_" .. subname .. "_three_quarter_inverted 1",
	recipe = {
		{modname .. ":slab_" .. subname .. "_three_quarter"},
	},
})

minetest.register_craft({
	output = modname .. ":slab_" .. subname .. "_three_quarter 1",
	recipe = {
		{modname .. ":slab_" .. subname .. "_three_quarter_inverted"},
	},
})

minetest.register_craft({
	output = modname .. ":slab_" .. subname .. "_three_quarter 1",
	recipe = {
		{modname .. ":slab_" .. subname .. "_quarter"},
		{modname .. ":slab_" .. subname .. "_quarter"},
		{modname .. ":slab_" .. subname .. "_quarter"},
	},
})

minetest.register_craft({
	output = modname .. ":slab_" .. subname .. " 1",
	recipe = {
		{modname .. ":slab_" .. subname .. "_quarter"},
		{modname .. ":slab_" .. subname .. "_quarter"},
	},
})

minetest.register_craft({
	output = modname .. ":slab_" .. subname .. "_quarter 6",
	recipe = {
		{modname .. ":slab_" .. subname .. "_three_quarter"},
		{modname .. ":slab_" .. subname .. "_three_quarter"},
	},
})

minetest.register_craft({
	output = modname .. ":slab_" .. subname .. "_quarter_wall 6",
	recipe = {
		{modname .. ":slab_" .. subname .. "_wall"},
		{modname .. ":slab_" .. subname .. "_wall"},
		{modname .. ":slab_" .. subname .. "_wall"},
	},
})

minetest.register_craft({
	output = modname .. ":slab_" .. subname .. "_three_quarter_wall 1",
	recipe = {
		{modname .. ":slab_" .. subname .. "_quarter_wall", modname .. ":slab_" .. subname .. "_quarter_wall", modname .. ":slab_" .. subname .. "_quarter_wall"},
	},
})


minetest.register_craft({
	type = "cooking",
	output = modname .. ":slab_" .. subname .. "_stone",
	recipe = modname .. ":slab_" .. subname .. "_cobble",
})

minetest.register_craft({
	type = "cooking",
	output = modname .. ":slab_" .. subname .. "_stone_quarter",
	recipe = modname .. ":stair_" .. subname .. "_cobble_quarter",
})

minetest.register_craft({
	type = "cooking",
	output = modname .. ":slab_" .. subname .. "_stone_three_quarter",
	recipe = modname .. ":slab_" .. subname .. "_cobble_three_quarter",
})

minetest.register_craft({
	type = "cooking",
	output = modname .. ":slab_" .. subname .. "_stone_wall",
	recipe = modname .. ":slab_" .. subname .. "_cobble_wall",
})

minetest.register_craft({
	type = "cooking",
	output = modname .. ":slab_" .. subname .. "_stone_quarter_wall",
	recipe = modname .. ":slab_" .. subname .. "_cobble_quarter_wall",
})

minetest.register_craft({
	type = "cooking",
	output = modname .. ":slab_" .. subname .. "_stone_three_quarter_wall",
	recipe = modname .. ":slab_" .. subname .. "_cobble_three_quarter_wall",
})
end
