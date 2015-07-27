s = {"interesting", "chicken", "pepper", "pork", "spag_os", "epic", "liver",}
h = {6, 7, 8, 9, 7, 5, 20, 1}
d = {"Interesting", "Chicken", "Pepper", "Pork", "Spaghezti O", "EPIC", "Nasty Liver"}
for i = 1, 7 do
  minetest.register_craftitem("soupsplus:soup_"..s[i], {
    description = d[i].." Soup",
    stack_max = 3,
	  inventory_image = "soupsplus_soup_"..s[i]..".png",
    on_use = function(itemstack, user, pointed_thing)
      minetest.item_eat(h)
      itemstack:take_item()
      return itemstack
    end,
  })
end
minetest.register_craftitem("soupsplus:bowl", {
  description = "Empty Bowl",
	inventory_image = "soupsplus_bowl.png",
	stack_max = 3,
	liquids_pointable = true,
	on_use = function(itemstack, user, pointed_thing)
	  if minetest.get_item_group(pointed_thing, "water") then
	    local pos = minetest.get_pointed_thing_position(pointed_thing, above)
	    minetest.set_node("default:air", pos)
	    itemstack:take_item()
	    local inv = user:get_inventory()
	    inv:add_item("main", "soupsplus:bowl_water")
	    return itemstack
	  end
	end,
})
minetest.register_craftitem("soupsplus:bowl_water", {
  description = "Bowl of Warm Water",
  inventory_image = "soupsplus_bowl_water.png",
  stack_max = 3,
})
minetest.register_craftitem("soupsplus:spag_os", {
  description = "Spaghetzi O's",
  inventory_image = "soupsplus_spag_os.png",
  on_use = function(itemstack, user, pointed_thing)
    minetest.item_eat(2)
    itemstack:take_item()
    return itemstack
  end,
})
minetest.register_craft({
output = "soupsplus:spag_os 12", 
recipe = {
  {"farming:flour","farming:string","farming:flour"},
  {"farming:string","bucket:bucket_water","farming:string"},
  {"farming:flour", "farming:string", "farming:flour"},}
})
minetest.register_craft({
output = "soupsplus:bowl_water 3", 
recipe = {
  {"default:wood","bucket:bucket_water","default:wood"},
  {"default:stick","default:wood","default:stick"},}
})
minetest.register_craft({
output = "soupsplus:bowl 1", 
recipe = {
  {"default:wood","","default:wood"},
  {"default:stick","default:wood","default:stick"},}
})
minetest.register_craft({
output = "soupsplus:soup_interesting 1", 
recipe = {
  {"default:sword_wood","default:dirt","default:mossycobble"},
  {"","soupsplus:soup_liver",""},}
})
minetest.register_craft({
output = "soupsplus:soup_chicken 1", 
recipe = {
  {"farming:straw","farming:seed_wheat","default:dirt"},
  {"","soupsplus:soup_liver",""},}
})
minetest.register_craft({
output = "soupsplus:soup_pepper 3", 
recipe = {
  {"default:wood","bucket:bucket_lava","default:"},
  {"","soupsplus:soup_liver",""},}
})
minetest.register_craft({
output = "soupsplus:soup_pork 1", 
recipe = {
  {"bucket:bucket_water","default:dirt","bucket:bucket_water"},
  {"","soupsplus:soup_liver",""},}
})
minetest.register_craft({
output = "soupsplus:soup_spag_os 2", 
recipe = {
  {"soupsplus:spag_os","soupsplus:spag_os","soupsplus:spag_os"},
  {"","soupsplus:bowl_water",""},}
})
minetest.register_craft({
output = "soupsplus:soup_epic 3", 
recipe ={
  {"default:steel","default:steel","default:steel"},
  {"","soupsplus:soup_spag_os",""},}
})
minetest.register_craft({
output = "soupsplus:soup_liver 3", 
recipe = {
  {"default:dirt","default:coal","default:dirt"},
  {"","soupsplus:bowl_water",""},}
})
