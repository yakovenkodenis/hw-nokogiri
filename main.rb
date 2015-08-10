require_relative 'file_reader.rb'
require_relative 'titles_scrapper.rb'

# Get all the titles form the urls in the
# provided text file and display them on
# the console screen.

urls = FileReader.new('./example.txt').read_from_file
titles = TitlesScrapper.new(urls).titles

puts titles
