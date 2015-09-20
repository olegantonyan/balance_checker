# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'balance_checker/version'

Gem::Specification.new do |spec|
  spec.name          = "balance_checker"
  spec.version       = BalanceChecker::VERSION
  spec.authors       = ["Oleg Antonyan"]
  spec.email         = ["oleg.b.antonyan@gmail.com"]

  spec.summary       = %q{Utility to check your balance on ISP website and notify you when it's low}
  spec.description   = %q{Logins to a given site, parses it to retrieve required number and notifies you when it's lower the threshold}
  spec.homepage      = "https://github.com/olegantonyan/balance_checker"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.executables << 'balance_checker'
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
  spec.add_runtime_dependency "mechanize"
  spec.add_runtime_dependency "activesupport"
end
