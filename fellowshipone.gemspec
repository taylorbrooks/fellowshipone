$:.push File.expand_path("../lib", __FILE__)

Gem::Specification.new do |s|
  s.name              = 'fellowshipone'
  s.version           = '1.3.3'
  s.authors           = ['Taylor Brooks']
  s.email             = ['tbrooks@gmail.com']
  s.homepage          = 'https://github.com/taylorbrooks/fellowshipone'

  s.summary = 'Ruby gem/plugin to interact with the FellowshipOne API (https://developer.fellowshipone.com/).'
  s.description = 'Ruby gem/plugin to interact with the FellowshipOne API (https://developer.fellowshipone.com/). Checkout the project on github for more detail.'
  s.license = 'MIT'

  s.add_development_dependency "bundler"
  s.add_development_dependency "rake"
  s.add_development_dependency "minitest"
  s.add_development_dependency "vcr"
  s.add_development_dependency "webmock"

  s.add_runtime_dependency "faraday"
  s.add_runtime_dependency "faraday_middleware"
  s.add_runtime_dependency "simple_oauth"
  s.add_runtime_dependency "hashie"
  s.add_runtime_dependency "json"
  s.add_runtime_dependency "addressable"

  s.files         = `git ls-files`.split("\n").delete_if { |f| !(f =~ /^examples/).nil? }
  s.test_files    = `git ls-files -- {test,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
