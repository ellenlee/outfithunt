class RequestOutfitsController < ApplicationController
	before_action :set_request

	def index
	end

	private
	def set_request
		@request = current_user.requests.find(params[:request_id])
		
	end
end
