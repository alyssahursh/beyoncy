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
    @params = params
    puts "************************"
    puts @params
    puts "************************"
    @order_product = OrderProduct.new
    @order_product.product_id = params[:id]
    @order_product.order_id = session[:cart_id]
    @order_product.qty = 1
    @order_product.price_per = Product.find(params[:id]).price * @order_product.qty
    if @order_product.save!
      redirect_to '/cart'
    else
      render # UNKNOWN
    end
  end

  def edit
  end

  def update
    if @order_product.update!(order_product_params)
      redirect_to '/cart'
    else
      render # UNKNOWN
    end
  end

  def destroy
    @order_product.destroy!
    redirect_to '/cart'
  end




  private
  def find_order_product
    @order_product = OrderProduct.find(params[:id])
    if @order_product.nil?
      render :file => 'public/404.html', :status => :not_found
    end
  end

  def order_product_params
    # params.require(:order_product).permit(:qty, :price_per)
  end

end
