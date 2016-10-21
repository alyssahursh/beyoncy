class CartsController < ApplicationController
  def index
  end

  def show
    @order_products = current_order.order_items
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
