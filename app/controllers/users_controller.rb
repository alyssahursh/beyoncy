class UsersController < ApplicationController
  before_action :find_user
  before_action :check_active
  before_action :check_admin, only: [:new, :create, :index]
  before_action :find_uiq, only: [:edit, :create, :update]

  def index ; end

  def show
    @addresses = Address.where(user_id: @user.id)
  end

  def new
    user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save!
      flash[:notice] = "User successfully added."
      redirect_to users_path
    else
      render # UNKNOWN
    end
  end

  def edit ;  end

  def update
    if @user_in_question.update!(user_params)
      flash[:notice] = "Information updated successfully."
      if @user != @user_in_question
        redirect_to users_path
      else
        redirect_to account_path
      end
    else
      flash[:notice] = "Your information could not be saved. Please check and try again"
      redirect_to account_edit_path
    end
  end

  def destroy
    @user.destroy!
    redirect_to root_path
  end

  private
  def find_user
    @user = User.find_by(id: session[:user_id])
    if @user.nil?
      render :file => 'public/404.html', :status => :not_found
    end
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :birthdate, :phone, :admin, :active, :uid, :provider)
  end

  def check_admin
    if @user.admin
      @users = User.all
    else
      flash[:notice] = "You do not have access to the requested page. Instead, here's your account page."
      redirect_to account_path
    end
  end

  def check_active
    if !@user.active
      flash[:notice] = "Your account is not active. Please contact support to be activated."
      redirect_to root_path
    end
  end

  def logged_in?
    if @user.id.nil?
      return false
    else
      return true
    end
  end

  def find_uiq
    @user_in_question = User.find_by(id: params[:id])
  end
end
