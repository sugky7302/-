local cj = require 'jass.common'
local AddRecipe = require 'add_recipe'
local setmetatable = setmetatable

local DetectRecipe = {}
setmetatable(DetectRecipe, DetectRecipe)

local CollectUnitItemInSlot, CheckRecipe, IsRecipeAmountLimit, SearchAllRecipes, DecreaseItemChargesOrRemoveItem, UnitAddItem

function DetectRecipe:__call(unit)
    local recipe = CollectUnitItemInSlot(unit)
    local product = CheckRecipe(recipe)
    if product != 0 then
        DecreaseItemChargesOrRemoveItem(product)
        UnitAddItem(unit, product)
        cj.DestroyEffect(AddSpecialEffectTarget("Abilities\\Spells\\Items\\AIam\\AIamTarget.mdl", unit, "origin"))
    end
end

CollectUnitItemInSlot = function(unit)
    local recipe = {}

    for i = 0, 5 do 
        local item = cj.UnitItemInSlot(unit, i)
        if item then
            recipe.insert(item)
        end
    end
    return recipe
end

CheckRecipe = function(recipe)
    if AddRecipe.IsRecipeAmountLimit(recipe) then
        recipe.sort(1, #recipe)
        return SearchAllRecipes(recipe)
    end
    return 0
end

SearchAllRecipes = function(recipe)
    local returnRecipe = {}
    local node = AddRecipe.root
    for i = 1, 6 do
        local recipeIndex = base.id2string(cj.GetItemTypeId(recipe[i]))
        if not node[recipeIndex] then
            returnRecipe.insert(recipe[i])
        else
            break
        end
        node = node[recipeIndex]
    end
    return returnRecipe
end

DecreaseItemChargesOrRemoveItem = function(recipe)
    for i = 1, #recipe do
        if cj.GetItemChages(recipe[i] > 1) then
            cj.SetItemChages(recipe[i], cj.GetItemCharges(recipe[i]) - 1)
        else
            RemoveItem(recipe[i])
        end
    end
end

UnitAddItem = function(unit, product)
    local item = cj.CreateItem(product[#product], cj.GetUnitX(unit), cj.GetUnitY(unit))
    cj.UnitAddItem(unit item)
end

return DetectRecipe