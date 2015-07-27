s = {"interesting", "chicken", "pepper", "pork", "spag_os", "epic", "liver",}
h = {6, 7, 8, 9, 7, 5, 20, 1}
function table.len(table)
  local i = 1
  while not table[i] = nil do
    i = i + 1
  end
end
for i = 1, table.len(s) do
  minetest.register_craftitem("soupsplus:soup_"..s[i], {
    description = s[i].." soup",
    stack_max = 1,
	  inventory_image = "soupsplus_"..s[i]..".png",
    on_use = function(itemstack, user, pointed_thing)
      minetest.item_eat(h)
      itemstack:take_item()
      return itemstack
    end,
  })
end
minetest.register_craftitem("soupsplus:bowl",
  description = "empty bowl",
	inventory_image = "soupsplus_bowl.png",
	stack_max = 3,
	liquids_pointable = true,
	on_use = function(itemstack, user, pointed_thing)
	  if minetest.get_item_group(pointed_thing, "water") then
	    local pos = minetest.get_pointed_thing_position(pointed_thing, above)
	    minetest.set_node("default:air", pos)
	    itemstack:take_item()
	    local inv = user:get_inventory()
	    if room_for_item("main", "soupsplus:bowl") then
	      inv:add_item
	    else then
	      
	    end
	    return itemstack
    end
	end,
})
minetest.register_craftitem("soupsplus:bowl_of_water", {
  description = "bowl of warm water",
	inventory_image = "soupsplus_water.png",
	stack_max = 3,
})
minetest.register_craft("soupsplus:bowl_of_water 3", {
  {"default:wood","bucket:bucket_water","default:wood"},
  {"default:stick","default:wood","default:stick"},
})
minetest.register_craft("soupsplus:bowl_of_water 1", {
  {"default:wood","","default:wood"},
  {"default:stick","default:wood","default:stick"},
})
minetest.register_craft("soupsplus:soup_interesting 1", {
  {"default:sword_wood","default:dirt","default:mossycobble"},
  {"","soupsplus:soup_liver",""},
})
minetest.register_craft("soupsplus:soup_chicken 1", {
  {"default:sword_wood","default:","default:mossycobble"},
  {"","soupsplus:soup_liver",""},
})
minetest.register_craft("soupsplus:soup_pepper 3", {
  {"default:wood","bucket:bucket_lava","default:"},
  {"","soupsplus:soup_liver",""},
})

minetest.register_on_craft(func(itemstack, player, old_craft_grid, craft_inv)

)
