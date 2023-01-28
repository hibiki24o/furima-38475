class SettlemntAddressesController < ApplicationController
  before_action :authenticate_user!, except: :index

  def index
    @settlemnt_address = SettlemntAddresse.new
    @product = Product.find(params[:product_id])

  end

  def new
    @settlemnt_address = SettlemntAddresse.new
  end

  def create
    @settlemnt_address = SettlemntAddresse.new(settlemnt_params)
    if @settlemnt_address.valid?
       @settlemnt_address.save
      redirect_to root_path
    else
      @product = Product.find(params[:product_id])
      render 'index'
    end
  end

  private

  def settlemnt_params
    params.require(:settlemnt_addresse).permit(:postal_code, :prefecture_id, :city, :address, :build_name, :tell).merge(user_id: current_user.id, product_id: params[:product_id])
  end
  
end
 