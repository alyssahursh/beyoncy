class AddressesController < ApplicationController
  before_action :find_address, except: [:index, :new, :create]

  def index
    @addresses = Address.all
  end

  def show
  end

  def new
    @address = Address.new
  end

  def create
    @address = Address.new(address_params)
    
    # puts @address.valid?
    # if ! @address.valid?
    #   @address.errors.each  do |attr, msg|
    #     puts "#{attr}: #{msg}"
    #   end
    # end

    if @address.save!
      redirect_to # UNKNOWN
    else
      render # UNKNOWN
    end
  end

  def edit
  end

  
  def update
    if @address.update!(address_params)
      redirect_to # UNKNOWN
    else
      render # UNKNOWN
    end
  end

  def destroy
    @address.destroy!
    redirect_to root_path
  end




  private
  def find_address
    @address = Address.find(params[:id])
    if @address.nil?
      render :file => 'public/404.html', :status => :not_found
    end
  end

  def address_params
    params.require(:address).permit(:kind, :first_name, :last_name, :street1, :street2, :city, :state, :zip, :country, :phone, :user_id)
  end

end
