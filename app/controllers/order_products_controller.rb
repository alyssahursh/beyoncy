class OrderProductsController < ApplicationController
  before_action :find_order_product, except: [:index, :new, :create]

  def index
    @order_products = OrderProduct.all
  end

  def show
  end

  def new
    @order_product = OrderProduct.new
  end

  def create
    @order_product = OrderProduct.new(order_product_params)
    if @order_product.save
      redirect_to # UNKNOWN
    else
      render # UNKNOWN
    end
  end

  def edit
  end

  def update
    if @order_product.update(order_product_params)
      redirect_to # UNKNOWN
    else
      render # UNKNOWN
    end
  end

  def destroy
    @order_product.destroy
    redirect_to root_path
  end




  private
  def find_order_product
    @order_product = OrderProduct.find(params[:id])
    if @order_product.nil?
      render :file => 'public/404.html', :status => :not_found
    end
  end

  def order_product_params
    params.require(:order_product).permit(:qty, :price_per)
  end

end
