class ApplicationController < ActionController::Base

include PublicActivity::StoreController

  protect_from_forgery
  before_filter :check_current_order 


  private

  # def current_user
  #   @current_user ||= User.find(session[:user_id]) if session[:user_id]
  # end
  # helper_method :current_user
  
  def authorize
    redirect_to root_path, alert: "NOT AUTHORIZED" if current_user.nil?
  end

  def authorize_admin
    unless current_user && current_user.is_admin?
      redirect_to root_path, alert: "NOT AUTHORIZED"
    end
  end


  def get_order
    @order = Order.first
  end

  def check_current_order
    @order = session[:current_order_id].nil? ? Order.new : Order.find_by_id(session[:current_order_id])
    # raise " "
    # @order = session[:current_order_id].nil? ? Order.new : Order.new
  end

  def save_order_session
    session[:current_order_id] = @order.id
  end

  def delete_current_order_session
    session[:current_order_id] = nil
    check_current_order
  end

#    def after_sign_in_path_for(resource_or_scope)
#    #if request.env['omniauth.origin']
#       redirect_to root_path
#     #end
# end
end
