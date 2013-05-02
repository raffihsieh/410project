require 'rubygems'
require 'nokogiri'
require 'open-uri'

class TestController < ApplicationController
  def home
  end

  def search
    values_from_form = params['search_box']

    words = values_from_form.split(' ')

    query = "http://allrecipes.com/search/default.aspx?qt=k&wt=" 
    for w in words do
      query += w
      query += "%20"
    end
    query += "&rt=r&origin=Recipe%20Search%20Results"

    page = Nokogiri::HTML(open(query))
    logger.debug("============================================")
    #logger.debug(page.xpath("//ctl00_CenterColumnPlaceHolder_rptResults_ctl00_ucResultContainer_ucRecipeGrid_imgLink"))
    #logger.debug(page.css("#img-link"))
    logger.debug("...................................................")
    arrs = []
    pics = []
    names = []

    for link in page.css(".img-link") do
      href = link["href"]
      href = "http://www.allrecipes.com#{href}"
      arrs.push("#{href}")
    #  arrs.push(href)
    
      logger.debug(href)
      logger.debug("------------------------------------------")
    end

    for link in page.css('a.img-link img') do

      src  = link["src"]
      name = link["title"]
      pics.push(src)
      names.push(name)

    end
    #logger.debug(page.css(".img-link"))

    logger.debug("============================================")
    puts page.class # => Nokogiri::HTML::Document

    @results = words[0]
    @values = arrs
    @recipes = names.uniq
    @images = pics.uniq
 
   
  end

end
