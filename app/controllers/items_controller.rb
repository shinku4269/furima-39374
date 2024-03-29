class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:show, :edit, :update, :destroy] 

  def index
    @items = Item.includes(:user).order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
    if (@item.user_id != current_user.id) || @item.purchase.present?
      redirect_to root_path
    end
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else
      render :edit
    end
  end

  def destroy
    if @item.user_id == current_user.id
      @item.destroy
    else
      render :show  
    end
    redirect_to root_path
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :price, :category_id, :status_id, :shipping_charges_id, :shipping_area_id, :shipping_day_id, {images: []}).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
