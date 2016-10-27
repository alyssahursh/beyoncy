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
    find_cart

    already_in = false

    @order.order_products.each do |order_product|
      puts "(((((((((((((((())))))))))))))))"
      puts order_product.product_id
      puts params[:id]
      puts "((((((((((((((((()))))))))))))))))"
      if order_product.product_id.to_i == params[:id].to_i
        already_in = true
        @order_product = OrderProduct.find(order_product.id)
        @order_product.save
      end
    end
    puts "((((((((((((((((((((()))))))))))))))))))))"
    puts already_in
    puts "(((((((((((((((((((())))))))))))))))))))"

    if already_in
      @order_product.qty += 1
    else
      @order_product = OrderProduct.new
      @order_product.product_id = params[:id]
      @order_product.order_id = @order.id
      @order_product.qty = 1
      @order_product.price_per = Product.find(params[:id]).price
    end

    calc_line_price

    if @order_product.save!
      redirect_to '/cart'
    else
      render # UNKNOWN
    end
  end

  def edit
  end

  def update
    @order_product.qty += params[:delta].to_i
    @order_product.save

    calc_line_price


    if @order_product.qty == 0
      @order_product.delete
    end

    redirect_to '/cart'
  end

  def destroy
    @order_product.destroy!
    redirect_to '/cart'
  end




  private

  def calc_line_price
    @order_product.line_item_price = @order_product.qty * @order_product.price_per
    @order_product.save
  end

  def find_order_product
    @order_product = OrderProduct.find(params[:id])
    if @order_product.nil?
      render :file => 'public/404.html', :status => :not_found
    end
  end

  def find_cart
    @user = User.find_by(id: session[:user_id])
    @order = Order.find_by(user_id: @user.id, order_status: 'cart')
  end

  def order_product_params
    # params.require(:order_product).permit(:qty, :price_per)
  end

end
