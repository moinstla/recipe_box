require ('spec_helper')

describe(Category) do
  describe("#recipes") do
    # Lists all the recipes in the category 'Dessert'
    it("lists all the recipes in a category") do
      test_category = Category.create({tag: 'Dessert'})
      test_recipe = Recipe.create({title: 'Brownies', instruction: 'Bake', rating: 4})
      test_category.recipes.push(test_recipe)
      expect(test_category.recipes).to eq([test_recipe])
    end
  end
end
