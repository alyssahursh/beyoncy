class OrdersController < ApplicationController
  before_action :find_order, except: [:index, :new, :create]

  def index
    @orders = Order.all
  end

  def show
  end

  def new
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    if @order.save!
      redirect_to # UNKNOWN
    else
      render # UNKNOWN
    end
  end

  def edit
  end

  def update
    if @order.update!(order_params)
      redirect_to # UNKNOWN
    else
      render # UNKNOWN
    end
  end

  def destroy
    @order.destroy!
    redirect_to root_path
  end


  private
  def find_order
    @order = Order.find(params[:id])
    if @order.nil?
      render :file => 'public/404.html', :status => :not_found
    end
  end
  # added
  def order_params
    params.require(:order).permit(:order_status, :shipping_cost, :user_id) #changed from user to match model
  end

end
