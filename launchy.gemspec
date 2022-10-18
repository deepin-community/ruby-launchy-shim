# -*- encoding: utf-8 -*-

description = <<EOF
Launchy is a helper class for launching a web browser in a fire and forget
manner from Ruby programs. This is a minimal shim that replaces the original
Launchy on Debian, without all the code to support non-Debian systems.
EOF

Gem::Specification.new do |s|
  s.name = "launchy"
  s.version = `dpkg-parsechangelog -SVersion`.strip.split('.').first(3).join('.')
  s.authors = ["Antonio Terceiro"]
  s.date = "2015-10-20"
  s.summary = "helper class for launching a web browser"
  s.description = description
  s.email = "terceiro@debian.org"
  s.files = ["lib/launchy.rb"]
  s.homepage = "http://packages.debian.org/ruby-launchy-shim"
end
