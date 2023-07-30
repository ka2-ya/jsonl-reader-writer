require 'jsonl_reader_writer/writer'

RSpec.describe JsonlReaderWriter::Writer do
  let(:writer) { described_class.new(file_path) }
  let(:file_path) { 'spec/fixtures/output.jsonl' }

  describe '#write' do
    let(:data) { [{ 'key1' => 'value1' }, { 'key2' => 'value2' }] }

    after do
      File.delete(file_path) if File.exist?(file_path)
    end

    it 'writes each datum as a JSON-formatted line in the file' do
      writer.write(data)
      expect(File.readlines(file_path)).to eq ["{\"key1\":\"value1\"}\n", "{\"key2\":\"value2\"}\n"]
    end
  end
end
