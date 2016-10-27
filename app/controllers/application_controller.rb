class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :set_categories

  def set_categories
    @categories = Category.all
  end

  def user_data
    @user = User.find(session[:user_id])
    @order = Order.find_by user_id: @user.id, order_status: 'cart'
    @cart_count = @order.order_products.length
  end

end
