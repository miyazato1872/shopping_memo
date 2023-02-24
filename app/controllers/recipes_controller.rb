class RecipesController < ApplicationController

  def index
  end

  def new
  end


  private

  def recipe_params
    params.require(:recipe).permit(:image).merge(user_id: current_user.id)
  end

end
