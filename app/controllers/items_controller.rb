class ItemsController < ApplicationController
  def index
  end

  private

  def item_params
    params.require(:items).permit(:name, :description, :price, :category_id, :status_id, :shipping_charges_id, :shipping_area_id, :shipping_day_id, :image).merge(user_id: current_user.id)
  end
end
