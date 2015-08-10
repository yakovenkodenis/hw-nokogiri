require 'uri'

# The class FileReader contains method
# read_from_file that should be used
# for reading all lines from the file in
# the provided path and returns the array
# of valid urls in the file.
class FileReader
  attr_reader :lines_count
  attr_reader :lines

  def initialize(path)
    @path = path
    @lines = []
  end

  # Reads all the lines from @path
  # and fills in the array of valid
  # urls.
  def read_from_file
    File.open(@path).each do |line|
      line = line.strip! || line
      lines << line if valid?(line)
    end
    lines
  end

  private

  # Checks if the url is valid.
  def valid?(url)
    return true if url =~ /\A#{URI::regexp}\z/
    false
  end
end
