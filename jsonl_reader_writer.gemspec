Gem::Specification.new do |spec|
  spec.name          = "jsonl_reader_writer"
  spec.version       = "0.1.0"
  spec.authors       = ["ka2yatanaka"]
  spec.email         = ["katwoya513@gmail.com"]

  spec.summary       = %q{JSON Lines file reader and writer for Ruby.}
  spec.description   = %q{This gem provides utilities for reading, filtering, mapping, and writing JSON Lines formatted files in Ruby.}
  spec.homepage      = "https://github.com/ka2yatanaka/jsonl_reader_writer"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.required_ruby_version = Gem::Requirement.new(">= 2.5.0")

  spec.add_dependency "json", ">= 2.0"
end
