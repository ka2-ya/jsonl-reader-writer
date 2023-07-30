# JSONL Reader Writer

`jsonl_reader_writer` is a Ruby gem that provides utilities for reading, mapping, filtering, and writing JSON Lines formatted files.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'jsonl_reader_writer'
```
And then execute:
```
$ bundle install
```

Or install it yourself as:
```
$ gem install jsonl_reader_writer
```

## Usage
```ruby
require 'jsonl_reader_writer'

# Create a reader instance
reader = JsonlReaderWriter::Reader.new('/path/to/your/jsonl_file.jsonl')

# Read and print each line
reader.each do |data, line_number|
  puts "Line #{line_number + 1}: #{data}"
end

# Filter the data
filtered_data = reader.filter do |data|
  data['some_key'] == 'some_value'
end

# Map the data
mapped_data = reader.map do |data|
  data['some_key']
end

# Create a writer instance
writer = JsonlReaderWriter::Writer.new('/path/to/your/output_file.jsonl')

# Write data
writer.write({ some_key: 'some_value' })

# Write multiple records
records = [
  { record_1_key: 'record_1_value' },
  { record_2_key: 'record_2_value' },
]
writer.write(records)

# Write data with validation
writer.write({ some_key: 'some_value' }, validate: true)

```

## Development
After checking out the repo, run bin/setup to install dependencies. Then, run rake spec to run the tests. You can also run bin/console for an interactive prompt that will allow you to experiment.

## Contributing
Bug reports and pull requests are welcome on GitHub at https://github.com/your_username/jsonl_reader_writer. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the Contributor Covenant code of conduct.

## License
The gem is available as open source under the terms of the MIT License.