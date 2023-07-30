require 'json'

module JsonlReaderWriter
  class Writer
    def initialize(file_path)
      @file_path = file_path
    end

    def write(data)
      File.open(@file_path, 'w') do |f|
        data.each { |datum| f.puts(JSON.generate(datum)) }
      end
    end
  end
end
