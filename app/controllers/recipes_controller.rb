class RecipesController < ApplicationController
  def show
    @recipe = Recipe.find(params[:id])
  end

  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
  end

  def create
    #byebug
    @recipe = Recipe.create(recipe_params(:title))
    @recipe.ingredients_attributes= {0 => {name: recipe_ingredient_params(:attributes_0_name)[:attributes_0_name], quantity: recipe_ingredient_params(:attributes_0_quantity)[:attributes_0_quantity]}, 1 => {name: recipe_ingredient_params(:attributes_1_name)[:attributes_1_name], quantity: recipe_ingredient_params(:attributes_1_quantity)[:attributes_1_quantity]}}
    @recipe.save
  end

  private

    def recipe_params(*args)
      params.require(:recipe).permit(*args)
    end

    def recipe_ingredient_params(*args)
      params.require(:recipe_ingredients).permit(*args)
    end
end
