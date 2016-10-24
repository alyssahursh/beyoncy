class ProductsController < ApplicationController
  before_action :find_product, except: [:index, :new, :create]


  def index
    @products = Product.all
  end

  def show
    @review = Review.new
  end

  def new
    @product = Product.new
    # @categories = Category.all.map{|c| [ c.name, c.id ] }
  end

  def create
    @product = Product.new(product_params)
    @product.category_id = params[:category_id]
    if @product.save!
      redirect_to action: "index"
    else
      render :action => :new
    end
  end

  def edit
    # @categories = Category.all.map{|c| [ c.name, c.id ] }
  end
  
  # TODO jm-rives discuss category id and why it sets thing to nil
  def update
    # sets category_id to nil? 
    # @product.category_id = params[:category_id]
    if @product.update!(product_params)
      redirect_to action: "show"
    else
      render :action => :edit
    end
  end

  #TODO why does this archive instead of destroy product, consider under puts/ post?
  def destroy!
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
    params.require(:product).permit(:name, :description, :price, :inventory_qty, :picture, :category_id)
  end

end
