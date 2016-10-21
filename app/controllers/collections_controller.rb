class CollectionsController < ApplicationController
  before_action :set_outfit

  def create
    current_user.collected_outfits << @outfit

    respond_to do |format|
      format.js {render template: "collections/collections"}
    end
  end

  def destroy
    current_user.collected_outfits.delete(@outfit)

    respond_to do |format|
      format.js {render template: "collections/collections"}
    end
  end
  # def destroy
  #   @post = Post.find_by_id(params[:id])
  #   current_user.liked_posts.delete(@post)

  #   respond_to do |format|
  #     format.js {render :template => 'likes/likes'}
  #   end
  # end
  private
  def set_outfit
    @outfit = Outfit.find_by_id(params[:id])
  end
end
