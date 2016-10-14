class RequestsController < ApplicationController
	def new
		@request = current_user.requests.build
		@colors = Color.all
		@materials = Material.all
		@categories = Category.all
	end
end
