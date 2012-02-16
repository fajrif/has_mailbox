# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "has_mailbox/version"

Gem::Specification.new do |s|
  s.name        = "has_mailbox"
  s.version     = HasMailbox::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Fajri Fachriansyah"]
  s.email       = ["fajrif@hotmail.com"]
  s.homepage    = ""
  s.summary     = %q{Add ability for each user to have a Mailbox}
  s.description = %q{This gem allowing each user to send and receive private messages}

  s.rubyforge_project = "has_mailbox"

  s.add_runtime_dependency "jquery-rails"
  s.add_runtime_dependency "will_paginate"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
