class PurchasesController < ApplicationController

  def index
    @purchase_destination = PurchaseDestination.new
  end

  def create
    @purchase_destination = PurchaseDestination.new(purchase_params)
    if @purchase_destination.valid?
      @purchase_destination.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def purchase_params
    params.require(:purchase_destination).permit(:post_code, :shipping_area_id, :city, :address, :building_name, :phone_number, :user_id, :item_id, :purchase_id).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end
