class RequestOutfitsController < ApplicationController
	before_action :set_request

	def index
		@outfits = Outfit.includes(:items).where( items: {color: @request.color, material: @request.material, category: @request.category })
	end

	def show
		
	end

	private
	def set_request
		@request = current_user.requests.find(params[:request_id])
		
	end
end