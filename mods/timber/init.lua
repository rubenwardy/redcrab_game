minetest.register_tool("timber:axe",{
 type="tool",
	
	description = "Mese axe",
	groups = {},
	inventory_image = "mese_axe.png",
	wield_image = "mese_axe.png",
	wield_scale = {x=1,y=1,z=1},
	stack_max = 1,
	liquids_pointable = false,
	tool_capabilities = {
		full_punch_interval=1.5,
		max_drop_level=1,
		groupcaps={
		choppy={maxlevel=2, uses=20, leveldiff=1, times={[1]=1.60, [2]=1.20, [3]=0.80}}
		}
	},
})


minetest.register_craft({
	output = 'timber:axe 1',
	recipe = {
		{'default:mese', 'default:mese'},
		{'default:mese', 'default:stick'},
		{'', 'default:stick'}
		
	},
})

timber_nodenames={"default:jungletree", "default:papyrus", "default:cactus", "default:tree"}

minetest.register_on_dignode(function(pos, node, digger)
	if digger:get_wielded_item():get_name() ~= "timber:axe" then
    return
end
    local i=1
    while timber_nodenames[i]~=nil do
        if node.name==timber_nodenames[i] then
            np={x=pos.x, y=pos.y+1, z=pos.z}
            while minetest.env:get_node(np).name==timber_nodenames[i] do
                minetest.env:remove_node(np)
                digger:get_inventory():add_item('main', timber_nodenames[i])
                np={x=np.x, y=np.y+1, z=np.z}
            end
        end
        i=i+1
    end
end)
