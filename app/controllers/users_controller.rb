class UsersController < ApplicationController

  def profile
    @requests = current_user.requests
    @outfits = current_user.collected_outfits
  end
end
