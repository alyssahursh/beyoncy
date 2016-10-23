class PagesController < ApplicationController

  # required for the test to be able to see the categories and products
  # is this good practice? is there a better way to get access to these in the tests?
  attr_reader :categories, :products

  def index
    logged_in?
    @user = User.find_by(id: session[:user_id])
    @categories = Category.all
    @products = Product.all
  end

  private
  def logged_in?
    if session[:user_id].nil?
      render layout: 'not_logged_in'
    else
      render layout: 'application'
    end
  end
end
