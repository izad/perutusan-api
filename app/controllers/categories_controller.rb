require 'open-uri'

class CategoriesController < ApplicationController

  include ApplicationHelper

  def index
  end

  def show
    if params[:second].present?
      path = "#{params[:first]}/#{params[:second]}"
    else
      path = params[:first]
    end

    @doc = Nokogiri::HTML(open("#{base_mobile_url}/#{path}"))
  end

  def video
    render json: { video: true }
  end

end
