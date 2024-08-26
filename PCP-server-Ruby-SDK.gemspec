# -*- encoding: utf-8 -*-

=begin
#Commerce Platform API

#RESTful API for the creation of Commerce Cases with Checkouts and the execution of Payments. 

The version of the OpenAPI document: 1.8.0

Generated by: https://openapi-generator.tech
Generator version: 7.7.0

=end

$:.push File.expand_path("../lib", __FILE__)
require "PCP-server-Ruby-SDK/version"

Gem::Specification.new do |s|
  s.name        = "PCP-server-Ruby-SDK"
  s.version     = PCPServerSDK::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["PAYONE GmbH"]
  s.email       = [""]
  s.homepage    = "https://github.com/PAYONE-GmbH/PCP-ServerSDK-ruby"
  s.summary     = "Commerce Platform API Ruby Gem"
  s.description = "RESTful API for the creation of Commerce Cases with Checkouts and the execution of Payments. "
  s.license     = "MIT"
  s.required_ruby_version = ">= 2.7"
  s.metadata = {}

  s.add_runtime_dependency 'httpx', '~> 1.0', '>= 1.0.0'
  s.add_runtime_dependency 'net-http'
  s.add_runtime_dependency 'json'
  s.add_runtime_dependency 'openssl'

  s.add_development_dependency 'minitest', '~> 5.24.1', '>= 5.24.0'
  s.add_development_dependency 'simplecov', '~> 0.22.0' 

  s.files         = `find *`.split("\n").uniq.sort.select { |f| !f.empty? }
  s.test_files    = `find spec/*`.split("\n")
  s.executables   = []
  s.require_paths = ["lib"]
end
