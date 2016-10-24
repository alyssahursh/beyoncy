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
    if @product.save
      flash[:notice] = "Product created successfully!"
      redirect_to action: "index"
    else
      flash[:notice] = "Please be sure you have completed all fields."
      render :action => :new
    end
  end

  def edit
    # @categories = Category.all.map{|c| [ c.name, c.id ] }
  end

  def update
    @product.category_id = params[:category_id]
    if @product.update(product_params)
      flash[:notice] = "Product successfully saved!"
      redirect_to action: "show"
    else
      flash[:notice] = "Please be sure you have completed all fields."
      render :action => :edit
    end
  end

  def destroy
    @product.destroy
    redirect_to root_path
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
