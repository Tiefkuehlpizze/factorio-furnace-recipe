data:extend(
{
  {
    type = "technology",
    name = "electric-multi-furnace-1",
    icon_size = 128,
    icon = "__furnace-recipe__/graphics/technology/multi-furnace-tech.png",
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "electric-multi-furnace-1"
      }
    },
    prerequisites = {"advanced-material-processing-2"},
    unit =
    {
      count = 250,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1}
      },
      time = 30
    },
    order = "c-c-c"
  },
})

if settings.startup["furnancerecipe-add-additional-levels"].value == true then
    data:extend(
    {
      {
        type = "technology",
        name = "electric-multi-furnace-2",
        icon_size = 128,
        icon = "__furnace-recipe__/graphics/technology/multi-furnace-tech.png",
        effects =
        {
        -- Left empty: To be filled later with available recipes
        },
        prerequisites = {"electric-multi-furnace-1"},
        unit =
        {
          count = 300,
          ingredients =
          {
            {"automation-science-pack", 1},
            {"logistic-science-pack", 1},
            {"chemical-science-pack", 1},
            {"production-science-pack", 1}
          },
          time = 30
        },
        order = "c-c-c"
      },
      {
        type = "technology",
        name = "electric-multi-furnace-3",
        icon_size = 128,
        icon = "__furnace-recipe__/graphics/technology/multi-furnace-tech.png",
        effects =
        {
            -- Left empty: To be filled later with available recipes
        },
        prerequisites = {"electric-multi-furnace-2"},
        unit =
        {
          count = 400,
          ingredients =
          {
            {"automation-science-pack", 1},
            {"logistic-science-pack", 1},
            {"chemical-science-pack", 1},
            {"production-science-pack", 1}
          },
          time = 30
        },
        order = "c-c-c"
      },
    })
    
    -- Dynamic addition of effects to the recipes to ensure, the recipse are available
    if settings.startup["furnancerecipe-own-crafting-branch"].value == true then
        table.insert(data.raw.technology["electric-multi-furnace-2"]["effects"], {
            type = "unlock-recipe",
            recipe = "electric-multi-furnace-2"
        })
        table.insert(data.raw.technology["electric-multi-furnace-3"]["effects"], {
            type = "unlock-recipe",
            recipe = "electric-multi-furnace-3"
        })
    end
    if data.raw.item["electric-furnace-2"]
        and data.raw.item["electric-furnace-3"]
        and settings.startup["furnancerecipe-craft-from-bobs"].value == true
     then
        table.insert(data.raw.technology["electric-multi-furnace-2"]["effects"], {
            type = "unlock-recipe",
            recipe = "electric-multi-furnace-2-alt"
        })
        table.insert(data.raw.technology["electric-multi-furnace-3"]["effects"], {
            type = "unlock-recipe",
            recipe = "electric-multi-furnace-3-alt"
        })
     end
     if data.raw.item["electric-furnace-3"]
        and (
            settings.startup["furnancerecipe-craft-from-bobs-level3"].value == true 
            or settings.startup["furnancerecipe-craft-from-bobs"].value == true 
        ) then
        table.insert(data.raw.technology["electric-multi-furnace-3"]["effects"], {
            type = "unlock-recipe",
            recipe = "electric-multi-furnace-3-alt2"
        })
    end
end


