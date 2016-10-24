class PagesController < ApplicationController

  # required for the test to be able to see the categories and products
  # is this good practice? is there a better way to get access to these in the tests?
  attr_reader :categories, :products

  def index
    @user = User.find_by(id: session[:user_id])
    @categories = Category.all
    @products = Product.all
  end

end
