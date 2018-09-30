lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require "chronolog/version"

Gem::Specification.new do |s|
  s.version  = Chronolog::VERSION
  s.name     = "chronolog"
  s.license  = "MIT"
  s.summary  = "Chronolog is a CLI for logging time in plain text files"
  s.homepage = "https://github.com/vinc/chronolog"
  s.email    = "v@vinc.cc"
  s.authors  = ["Vincent Ollivier"]
  s.files    = Dir.glob("{bin,lib}/**/*.rb") + %w[LICENSE README.md]
  s.executables << "chronolog"
  s.add_runtime_dependency("chronic", "~> 0.10", ">= 0.10.0")
  s.add_runtime_dependency("rainbow", "~> 3.0",  ">= 3.0.0")
end
