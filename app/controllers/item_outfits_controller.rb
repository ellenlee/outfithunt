class ItemOutfitsController < ApplicationController
  before_action :set_item

  def index
    @outfits = @item.outfits
  end

  def show
    @outfit = Outfit.find(params[:id])
    @items = @outfit.items
    @related_item = @item
    @other_items = @outfit.items.where.not(id: @related_item)
    @recommend_items = Item.where.not(id: @outfit.items).sample(5)
  end

  private
  def set_item
    @item = Item.find(params[:item_id])

  end
end
