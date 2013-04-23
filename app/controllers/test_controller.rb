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
    arr = []
    for link in page.css(".img-link") do
      href = link.to_s().split("href")
      url = href[1].split("\"")
      arr.push(url[1])
      logger.debug(url[1])
      logger.debug("------------------------------------------")
    end
    #logger.debug(page.css(".img-link"))

    logger.debug("============================================")
    puts page.class # => Nokogiri::HTML::Document

    @results = words[0]
    @values = arr

  end

end
