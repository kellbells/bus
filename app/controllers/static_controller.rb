class StaticController < ApplicationController
  def home
  end

  def about_us
  end

  def how_it_works
  end
  
  def menu
    @restaurants = Restaurant.all
      @restaurant = @restaurants.find(params[:id])
  end

end
