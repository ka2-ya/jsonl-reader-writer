require 'json'

module JsonlReaderWriter
  # Reader class: Provides methods to read and process .jsonl files
  class Reader
    # initialize method: Takes a file path as an argument, and validates that the file is a .jsonl file
    def initialize(file_path)
      @file_path = file_path
      validate_file_extension
    end

    # each method: Opens the file, reads each line, parses it as JSON, and yields it along with its index
    # If there's an error parsing a line, it rescues the exception and prints an error message
    def each
      File.open(@file_path, 'r') do |f|
        f.each_line.with_index do |line, index|
          begin
            yield JSON.parse(line.chomp), index
          rescue => e
            puts "Error parsing line #{index + 1}: #{e.message}"
          end
        end
      end
    end

    # filter method: Iterates over each line in the file and adds it to an array if it meets the condition specified in the block
    def filter(&block)
      filtered_data = []

      each do |data, line_number|
        filtered_data << data if block.call(data)
      end

      filtered_data
    end

    # map method: Iterates over each line in the file and adds the result of the block operation to an array
    def map(&block)
      mapped_data = []

      each do |data, line_number|
        mapped_data << block.call(data)
      end

      mapped_data
    end

    private
      # validate_file_extension method: Checks if the file is a .jsonl file. If not, it raises an ArgumentError
      def validate_file_extension
        unless @file_path.end_with?('.jsonl')
          raise ArgumentError, 'File must be a .jsonl file'
        end
      end
  end
end
