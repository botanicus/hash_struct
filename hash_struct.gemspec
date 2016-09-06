#!/usr/bin/env gem build
# encoding: utf-8

require "base64"

Gem::Specification.new do |s|
  s.name = "hash_struct"
  s.version = "0.3"
  s.authors = ["Jakub Šťastný aka Botanicus"]
  s.homepage = "http://github.com/botanicus/hash_struct"
  s.summary = "HashStruct is similar to Struct from Ruby standard library, the difference is that HashStruct.generate creates a class which takes a hash with attributes rather than just positional arguments as Struct.new does."
  s.description = "" # TODO: long description
  s.cert_chain = nil
  s.email = Base64.decode64("c3Rhc3RueUAxMDFpZGVhcy5jeg==\n")
  s.has_rdoc = true

  # files
  s.files = `git ls-files`.split("\n")

  s.require_paths = ["lib"]

  # Ruby version
  s.required_ruby_version = ::Gem::Requirement.new(">= 1.9.1")

  # RubyForge
  s.rubyforge_project = "hash_struct"
end
