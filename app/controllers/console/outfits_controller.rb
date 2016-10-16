class Console::OutfitsController < ApplicationController
    def index
    @outfits = Outfit.all
  end

  def import
    msg = Outfit.import(params[:file])
    redirect_to console_outfits_path, notice: msg
  end
end
