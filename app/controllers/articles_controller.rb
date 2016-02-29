require 'open-uri'

class ArticlesController < ApplicationController

  def show    
    @doc = Nokogiri::HTML(open("http://www.utusan.com.my/#{params[:id].gsub('_', '.')}"))      
  end

end
