class OrdersController < ApplicationController
  before_action :find_user
  before_action :find_order, except: [:index, :new, :create]

  def index
    if @user.admin
      @orders = Order.all
    else
      @orders = Order.where(user_id: @user.id, order_status: 'ordered')
    end
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
    if @user.nil?
      # This should be session?
      @order = Order.where(order_status: 'cart')
    else
      @order = Order.find_by user_id: @user.id, order_status: 'cart'
    end
  end

  def update
    if @order.update!(order_params)
      redirect_to # UNKNOWN
    else
      render # UNKNOWN
    end

    if Order.find_by(user_id: @user.id, order_status: 'cart') == nil
      @order = Order.new(user_id: @user.id, order_status: 'cart')
      @order.save
    end

  end

  def destroy
    @order.destroy!
    redirect_to root_path
  end


  private
  def find_order
    @order = Order.find(params[:id])
  end

  def find_user
    @user = User.find_by(id: session[:user_id])
    # if @user.nil?
    #   @user = nil
    # end
  end

  # added
  def order_params
    params.require(:order).permit(:order_status, :shipping_cost, :user_id) #changed from user to match model
  end

end
