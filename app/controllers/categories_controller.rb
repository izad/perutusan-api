require 'open-uri'

class CategoriesController < ApplicationController

  def index
    categories = []

    doc = Nokogiri::HTML(open(base_url))

    doc.css('.megamenu li').each do |node|
      a = node.at_css('a')

      next if %w(Berita Video).include? a.content
      next unless node[:id].present? || a[:href].include?('berita/')
      break if a.content == 'Lain-lain'

      categories << {
        name: a.content,
        path: URI.parse(a[:href]).path
      }
    end

    categories[0], categories[1] = categories[1], categories[0]

    render json: categories
  end

  def show
    #render plain: params[:slug]

    if params[:second].present?
      path = "#{params[:first]}/#{params[:second]}"
    else
      path = params[:first]
    end

    doc = Nokogiri::HTML(open("#{base_url}/#{path}"))

    headlines = []

    doc.css('#itemPgContainer li').each do |node|
      h2 = node.at_css('h2')
      img = node.at_css('img')

      headline = {
        id: h2.at_css('a')[:href].split('/').last.split('-').last.gsub('.', '_'),
        title: h2.content,
        excerpt: node.css('p').last.content
      }

      if img.present?
        headline[:photo] = "#{base_url}#{img[:src].gsub('box_100', 'landscape_650')}"
      else
        headline[:photo] = nil
      end

      headlines << headline
    end

    render json: headlines
  end

  def video
    render json: { video: true }
  end

  private

    def base_url
      "http://www.utusan.com.my"
    end

end
