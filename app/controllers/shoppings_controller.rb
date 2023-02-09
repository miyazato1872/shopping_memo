class ShoppingsController < ApplicationController
  
  def index
  end

  def new
    @shopping = Shopping.new
  end
end
