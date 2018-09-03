class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :show_flash

  private

  def show_flash
    #flash.now[:notice] = "Found the services page!" if request.path == '/pages/services'
  end
end
