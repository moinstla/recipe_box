require("bundler/setup")
Bundler.require(:default)
require('pry')

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

# Read lists of recipes, ingredients, and categories
get ('/') do
  @recipes = Recipe.all
  @ingredients = Ingredient.all
  @categories = Category.all
  erb(:index)
end

# RECIPE
# direct to add recipe form
get('/recipes/add') do
  erb(:add_recipe_form)
end

# adds recipe to list
post('/recipes') do
  recipe_title = params["title"]
  instructions = params.fetch("instructions")
  @recipe = Recipe.create({:title => recipe_title, :instruction => instructions})
  @recipes = Recipe.all
  @categories = Category.all
  @ingredients = Ingredient.all
  erb(:recipe)
end

#  assigns category to recipe
get("/recipes/:id") do
  @ingredients = Ingredient.all
  @categories = Category.all
  @recipe = Recipe.find(params.fetch('id').to_i)
  erb(:recipe)
end
# shows new category for recipe
post('/recipes/:id/add_category') do
  @recipe = Recipe.find(params.fetch('id').to_i)
  @category = Category.find(params.fetch('category_id').to_i)
  @recipe.categories.push(@category)
  @categories = Category.all
  @ingredients = Ingredient.all
  erb(:recipe)
end

# shows new ingredient for recipe
post('/recipes/:id/add_ingredient') do
  @categories = Category.all
  @recipe = Recipe.find(params.fetch('id').to_i)
  @ingredient = Ingredient.find(params.fetch('ingredient_id').to_i)
  @recipe.ingredients.push(@ingredient)
  @ingredients = Ingredient.all
  erb(:recipe)
end

# INGREDIENTS
# direct to add ingredient form
get('/ingredients/add') do
  erb(:add_ingredient_form)
end

# adds ingredient to list
post('/ingredients') do
  ingredient_name = params["name"]
  @ingredient = Ingredient.create({:name => ingredient_name})
  @ingredients = Ingredient.all
  redirect to("/")
end
# routes to ingredient page
get('/ingredients/:id') do
  @ingredient = Ingredient.find(params.fetch('id').to_i)
  erb(:ingredient)
end

# CATEGORIES
# direct to add category form
get('/categories/add') do
  erb(:add_category_form)
end

# adds category to list
post('/categories') do
  category_tag = params["tag"]
  @category = Category.create({:tag => category_tag})
  @categories = Category.all
  redirect to("/")
end

get('/categories/:id') do
  @category = Category.find(params.fetch('id').to_i)
  erb(:category)
end
