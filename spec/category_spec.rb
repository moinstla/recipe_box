require ('spec_helper')

describe(Category) do
  describe("Category") do
    it { should have_and_belong_to_many(:recipes)}
  end

  describe("#recipes") do
    it("lists all the recipes in a category") do
      test_category = Category.create({tag: 'Dessert'})
      test_recipe = Recipe.create({title: 'Brownies', instruction: 'Bake', rating: 4})
      test_category.recipes.push(test_recipe)
      expect(test_category.recipes).to eq([test_recipe])
    end
  end

  describe("#update") do
    it("updates the name in the category") do
      test_category = Category.create({tag: 'Dessert'})
      test_category.update({tag: 'Sweets'})
      expect(test_category.tag).to eq("Sweets")
    end
  end

end
