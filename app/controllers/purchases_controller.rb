class PurchasesController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
    @purchase_destination = PurchaseDestination.new
  end

  def create
    @item = Item.find(params[:item_id])
    @purchase_destination = PurchaseDestination.new(purchase_params)
    if @purchase_destination.valid?
      pay_item
      @purchase_destination.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def purchase_params
    params.require(:purchase_destination).permit(:post_code, :shipping_area_id, :city, :address, :building_name, :phone_number, :user_id, :item_id, :purchase_id).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"] 
    Payjp::Charge.create(
      amount: @item.price,
      card: purchase_params[:token],
      currency: 'jpy'
    )
  end
end
