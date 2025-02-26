function on_built_rocket_silo(event)
    local entity = event.entity
    if not entity.valid then return end

    local prototype = entity.name == "entity-ghost" and entity.ghost_prototype or entity.prototype

    if prototype.type ~= "rocket-silo" then return end
    if not prototype.crafting_categories["rocket-building"] then return end

    if entity.get_recipe().name == "rocket-part" and entity.recipe_locked then
        entity.recipe_locked = false
    end
end

script.on_event(defines.events.on_built_entity, function(event)
    on_built_rocket_silo(event)
end)
