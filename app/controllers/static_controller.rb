class StaticController < ApplicationController
  def home
  end

  def about_us
  end

  def how_it_works
  end

  def contact_us
  end
  
  def menu
    @restaurants = Restaurant.all
    @dishes = Dish.all
    @dish = @dishes.find(params[:dishes_id])
    @order_dish = @dish.dup
  end

end
