class SettlemntAddressesController < ApplicationController
  before_action :authenticate_user!, only: :index
  before_action :set_product, only: [:index, :create]
  before_action :send_product, only: [:index, :create]

  def index
    @settlemnt_address = SettlemntAddresse.new
  end

  def new
    @settlemnt_address = SettlemntAddresse.new
  end

  def create
    @settlemnt_address = SettlemntAddresse.new(settlemnt_params)
    if @settlemnt_address.valid?
       pay_item
       @settlemnt_address.save
       redirect_to root_path
    else
      redirect_to  root_path
      render 'index'
    end
  end

  private

  def settlemnt_params
    params.require(:settlemnt_addresse).permit(:postal_code, :prefecture_id, :city, :address, :build_name, :tell).merge(user_id: current_user.id, product_id: params[:product_id], token: params[:token])
  end
  
  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  
    Payjp::Charge.create(
      amount: @product.price,  
      card: settlemnt_params[:token],  
      currency: 'jpy'                
    )
  end

  def set_product
    @product = Product.find(params[:product_id])
  end

  def send_product
    if current_user.id == @product.user_id or @product.settlemnt.present?
       redirect_to  root_path
    end
  end


end
 