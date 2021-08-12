class HomeController < ApplicationController
  def index
    render json: { welcome: 'to docker-rails api' }
  end
end
