class Console::ItemsController < ApplicationController
	def index
		
	end

	def import
		Item.import(params[:file])
    redirect_to console_items_path, notice: "Items imported."
	end

end
