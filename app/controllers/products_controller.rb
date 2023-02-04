class ProductsController < ApplicationController
  before_action :authenticate_user!, only: [:new]
  before_action :set_product, only: [:edit, :show, :update, :destroy]
  before_action :move_to_index, only: [:edit, :update, :destroy]

  def index
    @products = Product.order("created_at DESC")
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
    redirect_to  root_path
    else
    render :new
    end
  end

  def show
  end
  
  def edit
    if @product.settlemnt
      redirect_to  root_path
    end
  end

  def update
    @product.update(product_params)
    if @product.save
      redirect_to  product_path
      else
      render :edit
      end
  end

  def destroy
    if current_user.id == @product.user_id
    @product.destroy
    redirect_to  root_path
    end
  end

  private
  
  def product_params
    params.require(:product).permit(:image, :title, :explanation, :category_id, :status_id, :delivery_charge_id, :prefecture_id, :scheduled_day_id, :price).merge(user_id: current_user.id)
  end

  def move_to_index
      redirect_to root_path unless user_signed_in?
  end

  def set_product
    @product = Product.find(params[:id])
  end

end
