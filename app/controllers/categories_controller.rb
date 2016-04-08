require 'open-uri'

class CategoriesController < ApplicationController

  def index
  end

  def show
    if params[:second].present?
      path = "#{params[:first]}/#{params[:second]}"
    else
      path = params[:first]
    end

    @doc = Nokogiri::HTML(open("#{base_mobile_url}/#{path}"))

=begin
    headlines = []

    doc.css('.linklist li').each do |node|
      h2 = node.at_css('h2')
      img = node.at_css('img')

      headline = {
        id: h2.at_css('a')[:href].split('/').last.split('-').last.gsub('.', '_'),
        title: h2.content,
        timestamp: node.at_css('span').content
      }

      if img.present?
        headline[:photo] = "#{base_url}#{img[:src].gsub('box_80', 'landscape_650')}"
      else
        headline[:photo] = nil
      end

      headlines << headline
    end

    render json: headlines.slice(0, 50)
=end
  end

  def video
    render json: { video: true }
  end

  private

    def base_url
      "http://www.utusan.com.my"
    end

    def base_mobile_url
      "http://m.utusan.com.my"
    end

end
