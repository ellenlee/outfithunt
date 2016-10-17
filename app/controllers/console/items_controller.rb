class Console::ItemsController < ApplicationController
	layout 'console'
  def index
    @items = Item.all
	end

	def import
		msg = Item.import(params[:file])
    redirect_to console_items_path, notice: msg
	end

end
