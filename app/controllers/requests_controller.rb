class RequestsController < ApplicationController
	def new
		@request = current_user.requests.build
	end

	def create
		@request = current_user.requests.build(request_params)

		if @request.check_tags_sufficient(request_params)
			if @request.save
				redirect_to request_outfits_path(@request)
			else
				render "new"
			end
		else
			flash[:notice] = "標籤至少要 3 個以上哦！"
			render "new"
		end
	end

	private
	def request_params
		params.require(:request).permit(:user_id, :color_id, :material_id, :category_id, :style_id, :img)
	end
end
