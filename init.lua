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
    stack_max = 3,
	  inventory_image = "soupsplus_soup_"..s[i]..".png",
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
	      inv:add_item("main", "soupsplus:bowl_water")
	    else then
	      
	    end
	    return itemstack
    end
	end,
})
minetest.register_craftitem("soupsplus:bowl_water", {
  description = "bowl of warm water",
  inventory_image = "soupsplus_water.png",
  stack_max = 3,
})
minetest.register_craftitem("soupsplus:spag_os", {
  description = "spaghetzi o's",
  inventory_image = "soupsplus_spag_os.png",
  stack_max = 3,
  on_use = function(itemstack, user, pointed_thing)
    minetest.item_eat(2)
    itemstack:take_item()
    return itemstack
  end,
})
minetest.register_craft("soupsplus:spag_os 4", {
  {"farming:wheat","farming:string","farming:wheat"},
  {"farming:string","bucket:bucket_water","farming:string"},
  {"farming:wheat", "farming:string", "farming:wheat"},
})
minetest.register_craft("soupsplus:bowl_water 3", {
  {"default:wood","bucket:bucket_water","default:wood"},
  {"default:stick","default:wood","default:stick"},
})
minetest.register_craft("soupsplus:bowl 1", {
  {"default:wood","","default:wood"},
  {"default:stick","default:wood","default:stick"},
})
minetest.register_craft("soupsplus:soup_interesting 1", {
  {"default:sword_wood","default:dirt","default:mossycobble"},
  {"","soupsplus:soup_liver",""},
})
minetest.register_craft("soupsplus:soup_chicken 1", {
  {"farming:straw","farming:seed_wheat","default:dirt"},
  {"","soupsplus:soup_liver",""},
})
minetest.register_craft("soupsplus:soup_pepper 3", {
  {"default:wood","bucket:bucket_lava","default:"},
  {"","soupsplus:soup_liver",""},
})
minetest.register_craft("soupsplus:soup_pork 1", {
  {"bucket:bucket_water","default:dirt","bucket:bucket_water"},
  {"","soupsplus:soup_liver",""},
})
minetest.register_craft("soupsplus:soup_spag_os 2", {
  {"soupsplus:spag_os","soupsplus:spag_os","soupsplus:spag_os"},
  {"","soupsplus:bowl_water",""},
})
minetest.register_craft("soupsplus:soup_epic 3", {
  {"default:steel","default:steel","default:steel"},
  {"","soupsplus:soup_spag_os",""},
})
minetest.register_craft("soupsplus:soup_liver 3", {
  {"default:dirt","default:coal","default:dirt"},
  {"","soupsplus:bowl_water",""},
})
