#!/usr/bin/env gem build
# encoding: utf-8

Gem::Specification.new do |s|
  s.name = "hash_struct"
  s.version = "0.2"
  s.authors = ["Jakub Šťastný aka Botanicus"]
  s.homepage = "http://github.com/botanicus/hash_struct"
  s.summary = "HashStruct is similar to Struct from Ruby standard library, the difference is that HashStruct.new creates a class which takes a hash with attributes rather than just positional arguments as Struct.new does."
  s.description = "" # TODO: long description
  s.cert_chain = nil
  s.email = ["knava.bestvinensis", "gmail.com"].join("@")
  s.has_rdoc = true

  # files
  s.files = ["README.textile", "lib/hash_struct.rb", "spec/hash_struct_spec.rb"]
  s.require_paths = ["lib"]

  # Ruby version
  s.required_ruby_version = ::Gem::Requirement.new(">= 1.9.1")

  # RubyForge
  s.rubyforge_project = "hash_struct"
end
