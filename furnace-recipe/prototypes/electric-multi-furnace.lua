---- Helper functions
function piz_electric_multi_furnace(input)
  local original = util.table.deepcopy(data.raw["furnace"]["electric-furnace"])
  original.name = input.name
  original.type = "assembling-machine"
  original.ingredient_count = 8
  original.crafting_categories = {"smelting"}
  original.tint = input.tint
  original.crafting_speed = input.crafting_speed
  original.max_health = input.max_health or 150
  original.energy_usage = input.energy_usage or "280kW"
  original.module_slots = input.module_slots or 0
  original.minable = input.minable
  return original
end

---- Extending the data
data:extend({
  {
    type = "item",
    name = "electric-multi-furnace-1",
    icon = "__furnace-recipe__/graphics/icons/electric-multi-furnace-1.png",
    icon_size = 32,
    flags = {},
    subgroup = "smelting-machine",
    order = "c[electric-furnace-1]",
    place_result = "electric-multi-furnace-1",
    stack_size = 50
  },
  {
    type = "recipe",
    name = "electric-multi-furnace-1",
    ingredients = {
        {"electric-furnace", 1},
        {"iron-gear-wheel", 5},
        {"advanced-circuit", 5},
      },
    result = "electric-multi-furnace-1",
    energy_required = 1,
    enabled = false
  },
})

if settings.startup["furnancerecipe-add-additional-levels"].value == true then
  -- add additional furnance levels derived from bob's
  
  furnace_level2 = piz_electric_multi_furnace{
      name = "electric-multi-furnace-2",
      icon = "__furnace-recipe__/graphics/icons/electric-multi-furnace-2.png",
      tint = {r = 0.6, g = 0.2, b = 0.8},
      max_health = 380,
      module_slots = 4,
      crafting_speed = 3,
      energy_usage = "250kW",
      minable = {mining_time = 1, result = "electric-multi-furnace-2"},
  }
  furnace_level3 = piz_electric_multi_furnace{
      name = "electric-multi-furnace-3",
      icon = "__furnace-recipe__/graphics/icons/electric-multi-furnace-3.png",
      tint = {r = 0.2, g = 0.8, b = 0.2},
      max_health = 400,
      module_slots = 5,
      crafting_speed = 4,
      energy_usage = "300kW",
      minable = {mining_time = 1, result = "electric-multi-furnace-3"},
  }
  
  furnace_level2["animation"]["layers"][1]["hr_version"]["filename"] = "__furnace-recipe__/graphics/entity/hr-electric-multi-furnace-2.png"
  furnace_level2["animation"]["layers"][1]["filename"] = "__furnace-recipe__/graphics/entity/electric-multi-furnace-2.png"

  furnace_level3["animation"]["layers"][1]["hr_version"]["filename"] = "__furnace-recipe__/graphics/entity/hr-electric-multi-furnace-3.png"
  furnace_level3["animation"]["layers"][1]["filename"] = "__furnace-recipe__/graphics/entity/electric-multi-furnace-3.png"
  
  data:extend({
    {
      type = "item",
      name = "electric-multi-furnace-2",
      icon = "__furnace-recipe__/graphics/icons/electric-multi-furnace-2.png",
      icon_size = 32,
      flags = {},
      subgroup = "smelting-machine",
      order = "c[electric-furnace-2]-1",
      place_result = "electric-multi-furnace-2",
      stack_size = 50
    },
    {
      type = "item",
      name = "electric-multi-furnace-3",
      icon = "__furnace-recipe__/graphics/icons/electric-multi-furnace-3.png",
      icon_size = 32,
      flags = {},
      subgroup = "smelting-machine",
      order = "c[electric-furnace-3]-1",
      place_result = "electric-multi-furnace-3",
      stack_size = 50
    },
    furnace_level2,
    furnace_level3
  })

  -- own furnance branch (no crafting from bob's extensions)
  if settings.startup["furnancerecipe-own-crafting-branch"].value == true then
    data:extend({
      {
        type = "recipe",
        name = "electric-multi-furnace-2",
        ingredients =
        {
          {"electric-multi-furnace-1", 1},
          {"steel-plate", 15},
          {"stone-brick", 10},
          {"processing-unit", 5},
        },
        result = "electric-multi-furnace-2",
        energy_required = 1,
        enabled = false
      },
      {
        type = "recipe",
        name = "electric-multi-furnace-3",
        ingredients =
        {
          {"electric-multi-furnace-2", 1},
          {"steel-plate", 15},
          {"stone-brick", 10},
          {"processing-unit", 5},
        },
        result = "electric-multi-furnace-3",
        energy_required = 1,
        enabled = false
      },
    })
  end
  -- craft bob's extensions into multi-furnaces
  -- drawback: they can't be upgraded further when
  -- they aren't used as material for the next level
  -- probably not a good experience
  if data.raw.item["electric-furnace-2"]
        and data.raw.item["electric-furnace-3"]
        and settings.startup["furnancerecipe-craft-from-bobs"].value == true
     then
    data:extend({
      {
        type = "recipe",
        name = "electric-multi-furnace-2-alt",
        ingredients =
        {
          {"electric-furnace-2", 1},
          {"iron-gear-wheel", 5},
          {"processing-unit", 5},
        },
        result = "electric-multi-furnace-2",
        energy_required = 1,
        enabled = false
      },
      {
        type = "recipe",
        name = "electric-multi-furnace-3-alt",
        ingredients =
        {
          {"electric-furnace-3", 1},
          {"iron-gear-wheel", 5},
          {"processing-unit", 5},
        },
        result = "electric-multi-furnace-3",
        energy_required = 1,
        enabled = false
      }
    })
  end
  -- craft electric-furnance-3 into multi furnance as
  -- final product
  if data.raw.item["electric-furnace-3"]
        and (
            settings.startup["furnancerecipe-craft-from-bobs-level3"].value == true 
            or settings.startup["furnancerecipe-craft-from-bobs"].value == true 
        ) then
    data:extend({
      {
        type = "recipe",
        name = "electric-multi-furnace-3-alt2",
        ingredients =
        {
          {"electric-furnace-3", 1},
          {"iron-gear-wheel", 5},
          {"processing-unit", 5},
        },
        result = "electric-multi-furnace-3",
        energy_required = 1,
        enabled = false
      }
    })
  end
end

entity_multi_furnace = piz_electric_multi_furnace{
    name = "electric-multi-furnace-1",
    icon = "__furnace-recipe__/graphics/icons/electric-multi-furnace-1.png",
    tint = {r = 0.6, g = 0.2, b = 0.8},
    max_health = 350,
    module_slots = 2,
    crafting_speed = 2,
    energy_usage = "210kW",
    minable = {mining_time = 1, result = "electric-multi-furnace-1"}
  }

entity_multi_furnace["animation"]["layers"][1]["hr_version"]["filename"] = "__furnace-recipe__/graphics/entity/hr-electric-multi-furnace-1.png"
entity_multi_furnace["animation"]["layers"][1]["filename"] = "__furnace-recipe__/graphics/entity/electric-multi-furnace-1.png"

data:extend({
  entity_multi_furnace
})
