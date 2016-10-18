class UsersController < ApplicationController
  before_action :find_user, except: [:index, :new, :create]
  before_action :not_found, except: [:index, :new, :create]


  def index
    @users = User.all
  end

  def show
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to # UNKNOWN
    else
      render # UNKNOWN
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to # UNKNOWN
    else
      render # UNKNOWN
    end
  end

  def destroy
    @user.destroy
    redirect_to root_path
  end




  private
  def find_user
    @user = User.find(params[:id])
    if !@user.nil?
      render :file => 'public/404.html', :status => :not_found
    end
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :birthdate, :phone, :admin, :active, :uid, :provider)
  end

end
