for index, force in pairs(game.forces) do
    if force.recipes["electric-multi-furnace-2-alt"] then
        force.recipes["electric-multi-furnace-2-alt"].enabled = force.technologies["electric-multi-furnace-2"].researched
     end
     if force.recipes["electric-multi-furnace-3-alt"] then
        force.recipes["electric-multi-furnace-3-alt"].enabled = force.technologies["electric-multi-furnace-3"].researched
    end

    if force.recipes["electric-multi-furnace-3-alt2"] then
        force.recipes["electric-multi-furnace-3-alt2"].enabled = force.technologies["electric-multi-furnace-3"].researched
    end
end 
