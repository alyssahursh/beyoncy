class ProductsController < ApplicationController
  before_action :find_product, except: [:index, :new, :create]


  def index
    @products = Product.all
  end

  def show
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to # UNKNOWN
    else
      render # UNKNOWN
    end
  end

  def edit
  end

  def update
    if @product.update(product_params)
      redirect_to # UNKNOWN
    else
      render # UNKNOWN
    end
  end

  def destroy
    @product.archive
    redirect_to controller: 'pages', action: "index"
  end



  private
  def find_product
    @product = Product.find(params[:id])
    if @product.nil?
      render :file => 'public/404.html', :status => :not_found
    end
  end

  def product_params
    params.require(:product).permit(:name, :description, :price, :inventory_qty, :picture)
  end

end
