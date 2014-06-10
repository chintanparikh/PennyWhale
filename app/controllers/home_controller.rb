class HomeController < ApplicationController
  def index
    redirect_to app_root_path unless current_user.nil?
  end
end
