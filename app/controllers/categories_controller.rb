class CategoriesController < ApplicationController
  before_action :find_category, except: [:index, :new, :create]

  def index
    @categories = Category.all
  end

  def show
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save!
      redirect_to :action => "index"
    else
      render :action => :new
    end
  end

  def edit
  end

  def update
    if @category.update!(category_params)
      redirect_to :action => "index"
    else
      render :action => :edit
    end
  end

  def destroy
    @category.destroy!
    redirect_to root_path
  end




  private
  def find_category
    @category = Category.find(params[:id])
    if @category.nil?
      render :file => 'public/404.html', :status => :not_found
    end
  end

  def category_params
    params.require(:category).permit(:name)
  end

end
