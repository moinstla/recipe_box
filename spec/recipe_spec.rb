require('spec_helper')

describe(Recipe) do
  describe("Recipe") do
    it { should have_and_belong_to_many(:categories) }
    it { should have_and_belong_to_many(:ingredients) }
  end

  describe("#categories") do
    #List all the categories brownies are in: dessert, gluten-free, vegan
    it("adds and verifies adding a category to a recipe") do
      test_recipe = Recipe.create({title: 'Brownies', instruction: 'Bake', rating: 4})
      test_category = Category.create({tag: 'Dessert'})
      test_recipe.categories.push(test_category)
      expect(test_recipe.categories).to eq([test_category])
    end
  end

  describe("#ingredients") do
    #List all the ingredients in brownies
    it("adds and verifies adding an ingredient to a recipe") do
      test_recipe = Recipe.create({title: 'Brownies', instruction: 'Bake', rating: 4})
      test_ingredient = Ingredient.create({name: 'Chocolate'})
      test_recipe.ingredients.push(test_ingredient)
      expect(test_recipe.ingredients).to eq([test_ingredient])
    end
  end
end
