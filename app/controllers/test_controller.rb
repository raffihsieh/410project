require 'rubygems'
require 'nokogiri'
require 'open-uri'

class TestController < ApplicationController
  def home
  end

  def search
    values_from_form = params['search_box']

    words = values_from_form.split(' ')

    #page = Nokogiri::HTML(open(values_from_form))
    #logger.debug(page)
    #puts page.class # => Nokogiri::HTML::Document

    @results = words[0]

  end

end
