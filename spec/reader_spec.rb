require 'jsonl_reader_writer/reader'

RSpec.describe JsonlReaderWriter::Reader do
  let(:reader) { described_class.new(file_path) }

  describe '#each' do
    context 'when the file is correctly formatted' do
      let(:file_path) { 'spec/fixtures/correctly_formatted.jsonl' }

      it 'yields each line as a parsed JSON object along with its line number' do
        expect { |b| reader.each(&b) }.to yield_successive_args([{ 'key1' => 'value1' }, 0], [{ 'key2' => 'value2' }, 1])
      end
    end

    context 'when the file is incorrectly formatted' do
      let(:file_path) { 'spec/fixtures/incorrectly_formatted.jsonl' }

      it 'outputs an error message and skips the line' do
        expect { |b| reader.each(&b) }.to output(/Error parsing line 2/).to_stdout
      end
    end
  end

  describe '#filter' do
    let(:file_path) { 'spec/fixtures/multiple_records.jsonl' }

    it 'returns an array of data that match the filter criteria' do
      filtered_data = reader.filter { |data| data['key1'] == 'value1' }
      expect(filtered_data).to eq([{ 'key1' => 'value1', 'key2' => 'value2' }])
    end
  end

  describe '#map' do
    let(:file_path) { 'spec/fixtures/multiple_records.jsonl' }

    it 'returns an array of data that have been transformed by the block' do
      mapped_data = reader.map { |data| data.keys }
      expect(mapped_data).to eq([['key1', 'key2'], ['key3', 'key4']])
    end
  end
end
