require 'open-uri'

class ArticlesController < ApplicationController
  include ApplicationHelper

  def show
    components = params[:id].split('_')
    path = components.slice(0, components.length - 1).join('/')
    @link = "#{base_url}/#{path}/#{components.last.gsub('-', '.')}"
    @doc = Nokogiri::HTML(open(@link))
  end

end
