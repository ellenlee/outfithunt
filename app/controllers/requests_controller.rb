class RequestsController < ApplicationController
	def new
		@request = current_user.requests.build
		@colors = Color.all
		@materials = Material.all
		@categories = Category.all
	end

	def create
		@request = current_user.requests.build(request_params)
		if @request.save
			redirect_to 'new', notice: "新增成功！"
		else
			render "new"
		end
	end

	private 
	def request_params
		params.require(:request).permit(:user_id, :color_id, :material_id, :category_id)
	end
end
