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

  def titles
    urls.each do |url|
      @titles << Nokogiri::HTML(open(url)).css('title')[0].text
    end
    @titles
  end
end
