class UsersController < ApplicationController

  def profile
    @requests = current_user.requests

    @outfits_odd = Array.new
    @outfits_even = Array.new

    outfits = current_user.collected_outfits
    outfits.each_with_index do |outfit, index|
      if index % 2 == 1
        @outfits_odd << outfit
      else
        @outfits_even << outfit
      end
    end
  end
end
