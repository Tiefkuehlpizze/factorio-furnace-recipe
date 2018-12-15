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
        {"science-pack-1", 1},
        {"science-pack-2", 1},
        {"science-pack-3", 1}
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
          {
            type = "unlock-recipe",
            recipe = "electric-multi-furnace-2"
          }
        },
        prerequisites = {"electric-multi-furnace-1"},
        unit =
        {
          count = 300,
          ingredients =
          {
            {"science-pack-1", 1},
            {"science-pack-2", 1},
            {"science-pack-3", 1},
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
          {
            type = "unlock-recipe",
            recipe = "electric-multi-furnace-3"
          }
        },
        prerequisites = {"electric-multi-furnace-2"},
        unit =
        {
          count = 400,
          ingredients =
          {
            {"science-pack-1", 1},
            {"science-pack-2", 1},
            {"science-pack-3", 1},
            {"production-science-pack", 1}
          },
          time = 30
        },
        order = "c-c-c"
      },
    })
end
