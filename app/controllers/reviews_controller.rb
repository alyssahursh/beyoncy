class ReviewsController < ApplicationController
  before_action :find_review except: [:index, :new, :create]
  before_action :not_found except: [:index, :new, :create]


  def index
    @reviews = Review.all
  end

  def show
  end

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    if @review.save
      redirect_to # UNKNOWN
    else
      render # UNKNOWN
    end
  end

  def edit
  end

  def update
    if @review.update(review_params)
      redirect_to # UNKNOWN
    else
      render # UNKNOWN
    end
  end

  def destroy
    @review.destroy
    redirect_to root_path
  end




  private
  def find_review
    @review = Review.find(params[:id])
    if !@review.nil?
      render :file => 'public/404.html', :status => :not_found
    end
  end

  def review_params
    params.require(:review).permit(:subject, :body, :rating)
  end

end
