lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require "chronolog/version"

Gem::Specification.new do |s|
  s.version  = Chronolog::VERSION
  s.name     = "chronolog"
  s.license  = "MIT"
  s.summary  = "Log elapsed time"
  s.homepage = "https://github.com/vinc/chronolog"
  s.email    = "v@vinc.cc"
  s.authors  = ["Vincent Ollivier"]
  s.files    = Dir.glob("{bin,lib}/**/*.rb") + %w[LICENSE README.md]
  s.executables << "chronolog"
end
