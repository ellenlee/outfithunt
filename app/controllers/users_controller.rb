class UsersController < ApplicationController
  layout 'my_shelf'

  def profile
    @request = current_user.requests.last
    @requests = current_user.requests.where.not(id: @request).order(id: :desc)

    @outfits_odd = Array.new
    @outfits_even = Array.new

    outfits_record = current_user.collections.order(id: :desc)
    outfits = outfits_record.map do |record|
      Outfit.find(record.outfit_id)
    end

    outfits.each_with_index do |outfit, index|
      if index % 2 == 1
        @outfits_odd << outfit
      else
        @outfits_even << outfit
      end
    end
  end
end
