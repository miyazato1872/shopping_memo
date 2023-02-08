class ShoppingsController < ApplicationController
  
  def index
  end

  def create
    @shopping = Shopping.new(shopping_params)
    @shopping.save
  end

  private
  def shopping_params
  end
end
