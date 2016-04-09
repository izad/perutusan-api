class ApplicationController < ActionController::Base

  def welcome
    render json: { name: 'Perutusan API', version: 1.0 }
  end

end
