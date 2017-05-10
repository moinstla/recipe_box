require('spec_helper')

describe(Ingredient) do
  describe("#recipes") do
    #List all the recipes that have chocolate
    it("lists all the recipes that have the ingredient") do
      test_ingredient = Ingredient.create({name: 'Chocolate'})
      test_recipe = Recipe.create({title: 'Brownies', instruction: 'Bake', rating: 4})
      test_ingredient.recipes.push(test_recipe)
      expect(test_ingredient.recipes).to eq([test_recipe])
    end
  end
end
