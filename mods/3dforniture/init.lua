--[[
   3D Forniture
   
   Copyright 2012 Tonyka
   
   This program is free software; you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation; either version 2 of the License, or
   (at your option) any later version.
   
   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.
   
   You should have received a copy of the GNU General Public License
   along with this program; if not, write to the Free Software
   Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston,
   MA 02110-1301, USA.
   
   Contributors:


    Lesliev

        code
	information and assistance in various aspects

    InfinityProject

        suggested creating bathroom kit.

    cosarara97

        code.
   
]]--

dofile(minetest.get_modpath("3dforniture").."/crafting.lua")
dofile(minetest.get_modpath("3dforniture").."/nodes.lua")

--alias
minetest.register_alias('table', '3dforniture:table')
minetest.register_alias('chair', '3dforniture:chair')
minetest.register_alias('bars', '3dforniture:bars')
minetest.register_alias('binding_bars', '3dforniture:L_binding_bars')
minetest.register_alias('chains', '3dforniture:chains')
minetest.register_alias('torch_wall', '3dforniture:torch_wall')
minetest.register_alias('toilet', '3dforniture:toilet')
minetest.register_alias('sink', '3dforniture:sink')
minetest.register_alias('taps', '3dforniture:taps')
minetest.register_alias('shower_tray', '3dforniture:shower_tray')
minetest.register_alias('shower_head', '3dforniture:shower_head')
minetest.register_alias('table_lamp', '3dforniture:table_lamp_off')
minetest.register_alias('armchair', '3dforniture:armchair')

--function

local on_lamp_puncher = function (pos, node, puncher)
	if node.name == "3dforniture:table_lamp_off" then
		minetest.env:add_node(pos, {name="3dforniture:table_lamp_low"})
		nodeupdate(pos)
	elseif node.name == "3dforniture:table_lamp_low" then
		minetest.env:add_node(pos, {name="3dforniture:table_lamp_med"})
		nodeupdate(pos)
	elseif node.name == "3dforniture:table_lamp_med" then
		minetest.env:add_node(pos, {name="3dforniture:table_lamp_hi"})
		nodeupdate(pos)
	elseif node.name == "3dforniture:table_lamp_hi" then
		minetest.env:add_node(pos, {name="3dforniture:table_lamp_max"})
		nodeupdate(pos)
	elseif node.name == "3dforniture:table_lamp_max" then
		minetest.env:add_node(pos, {name="3dforniture:table_lamp_off"})
		nodeupdate(pos)
    end
end


local on_toilet_puncher = function (pos, node, puncher)
  if node.name == '3dforniture:toilet' then
    local dir = node["param2"]
    minetest.env:add_node(pos, {name="3dforniture:toilet_open", paramtype2='none', param2=dir})
    nodeupdate(pos)
  elseif node.name == '3dforniture:toilet_open' then
    local dir = node["param2"]
    minetest.env:add_node(pos, {name="3dforniture:toilet", paramtype2='none', param2=dir})
    nodeupdate(pos)
  end
end

minetest.register_on_punchnode(on_lamp_puncher)
minetest.register_on_punchnode(on_toilet_puncher)
