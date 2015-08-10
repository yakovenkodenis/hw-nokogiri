require 'nokogiri'
require 'open-uri'

# The class TitlesScrapper should
# be used for gathering titles of
# the web-pages addresses of which
# are passed in the initialize method
# in the form of array.
class TitlesScrapper
  attr_reader :urls
  attr_reader :titles

  def initialize(urls)
    @urls = urls
    @titles = []
  end

  # Iterates over the array of urls
  # and fills in the @titles array
  # with web-pages' title tag content.
  def titles
    urls.each do |url|
      @titles << Nokogiri::HTML(open(url)).css('title')[0].text
    end
    @titles
  end
end
