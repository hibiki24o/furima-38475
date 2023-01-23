class SettlementAddressController < ApplicationController
  before_action :authenticate_user!, except: :index

  def index
    @settlemnt_address = SettlementAddress.new
  end

  def new
    @settlemnt_address = SettlementAddress.new
  end

  def create
    @settlemnt_address = SettlementAddress.new(settlemnt_params)
    if @settlemnt_address.valid?
      @settlemnt_address.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def settlemnt_params
    params.require(:settlemnt_address).permit(:postal_code, :prefecture, :city, :house_number, :building_name, :price).merge(user_id: current_user.id)
  end

end
