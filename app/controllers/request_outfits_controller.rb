class RequestOutfitsController < ApplicationController
	before_action :set_request

	def index
		# @outfits = Outfit.related_list(@request)
		@outfits = Outfit.includes(:items).where( items: {color: @request.color, category: @request.category })
	end

	def show
 		@outfit = Outfit.find(params[:id])
 		@occasions = @outfit.occasions
 		@items = @outfit.items
 		@related_item = @outfit.related_item(@request)
 		@other_items = @outfit.items.where.not(id: @related_item)
		@recommend_items = Item.where.not(id: @outfit.items).sample(5)
	end

	private
	def set_request
		@request = current_user.requests.find(params[:request_id])

	end
end