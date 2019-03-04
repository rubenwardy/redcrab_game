-- Load translation library if intllib is installed

local S
if (minetest.get_modpath("intllib")) then
	dofile(minetest.get_modpath("intllib").."/intllib.lua")
	S = intllib.Getter(minetest.get_current_modname())
	else
	S = function ( s ) return s end
end

dofile(minetest.get_modpath("stairsplus").."/stairs.lua")
dofile(minetest.get_modpath("stairsplus").."/slabs.lua")
dofile(minetest.get_modpath("stairsplus").."/panels.lua")
dofile(minetest.get_modpath("stairsplus").."/microblocks.lua")

print(S("[stairsplus] loaded."))

--[[
****
Stairs+
by Calinou
Licensed under the zlib/libpng license for code and CC BY-SA for textures, see LICENSE.txt for info.
****
--]]

-- Nodes will be called <modname>:{stair,slab,panel,micro}_<subname>
function register_stair_slab_panel_micro(modname, subname, recipeitem, groups, images, description, drop, paramtype2)
	register_stair(modname, subname, recipeitem, groups, images, description, drop)
	register_slab(modname, subname, recipeitem, groups, images, description, drop, paramtype2)
	register_panel(modname, subname, recipeitem, groups, images, description, drop)
	register_micro(modname, subname, recipeitem, groups, images, description, drop)
end

register_stair_slab_panel_micro("stairsplus", "wood", "default:wood",
	{snappy=1,choppy=2,oddly_breakable_by_hand=2,flammable=3},
	{"default_wood.png"},
	"Wooden",
	"wood",
	"facedir")

register_stair_slab_panel_micro("stairsplus", "stone", "default:stone",
	{cracky=3},
	{"default_stone.png"},
	"Stone",
	"cobble",
	"none")

register_stair_slab_panel_micro("stairsplus", "cobble", "default:cobble",
	{cracky=3},
	{"default_cobble.png"},
	"Cobblestone",
	"cobble",
	"none")
	
register_stair_slab_panel_micro("stairsplus", "mossycobble", "default:mossycobble",
	{cracky=3},
	{"default_mossycobble.png"},
	"Mossy Cobblestone",
	"mossycobble",
	"none")

register_stair_slab_panel_micro("stairsplus", "brick", "default:brick",
	{cracky=3},
	{"default_brick.png"},
	"Brick",
	"brick",
	"facedir")

register_stair_slab_panel_micro("stairsplus", "sandstone", "default:sandstone",
	{crumbly=2,cracky=2},
	{"default_sandstone.png"},
	"Sandstone",
	"sandstone",
	"none")
	
register_stair_slab_panel_micro("stairsplus", "steelblock", "default:steelblock",
	{snappy=1,bendy=2,cracky=1,melty=2,level=2},
	{"default_steel_block.png"},
	"Steel Block",
	"steelblock",
	"none")
	
register_stair_slab_panel_micro("stairsplus", "desert_stone", "default:desert_stone",
	{cracky=3},
	{"default_desert_stone.png"},
	"Desert Stone",
	"desert_stone",
	"none")
	
register_stair_slab_panel_micro("stairsplus", "glass", "default:glass",
	{snappy=2,cracky=3,oddly_breakable_by_hand=3},
	{"default_glass.png"},
	"Glass",
	"glass",
	"none")
	
register_stair_slab_panel_micro("stairsplus", "tree", "default:tree",
	{tree=1,snappy=1,choppy=2,oddly_breakable_by_hand=1,flammable=2},
	{"default_tree_top.png", "default_tree_top.png", "default_tree.png"},
	"Tree",
	"tree",
	"none")
	
register_stair_slab_panel_micro("stairsplus", "jungletree", "default:jungletree",
	{tree=1,snappy=1,choppy=2,oddly_breakable_by_hand=1,flammable=2},
	{"default_jungletree_top.png", "default_jungletree_top.png", "default_jungletree.png"},
	"Jungle Tree",
	"jungletree",
	"none")
