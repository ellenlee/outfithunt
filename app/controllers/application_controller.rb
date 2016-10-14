class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate
  before_action :authenticate_user!


  protected
  def authenticate
    authenticate_or_request_with_http_basic do |user_name, password|
      user_name == "outfithunt" && password == "outfithunt2016"
  	end
  end
end
