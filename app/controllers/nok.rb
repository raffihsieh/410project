require 'rubygems'
require 'nokogiri'
require 'open-uri'

def parse_form
  values_from_form = params['search_box']

  page = Nokogiri::HTML(open("index.html"))
  puts page.class # => Nokogiri::HTML::Document

end
