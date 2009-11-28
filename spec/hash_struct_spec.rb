# encoding: utf-8

require "spec"
require_relative "../lib/hash_struct"

describe HashStruct do
  before(:each) do
    @struct = HashStruct.new(:first_name, :last_name)
  end

  describe ".new" do
    it "should raise ArgumentError if any attributes given" do
      lambda { HashStruct.new }.should raise_error(ArgumentError)
    end

    it "should create a new class" do
      @struct.class.should eql(Class)
    end

    it "should description" do
      instance = @struct.new(first_name: "Jakub", last_name: "Stastny")
      instance.first_name.should eql("Jakub")
      instance.last_name.should eql("Stastny")
    end

    it "should create instance method writer and reader method" do
      instance = @struct.new
      instance.first_name = "Jakub"
      instance.first_name.should eql("Jakub")
    end
  end

  describe "inheritance" do
    before(:each) do
      @hs = Class.new(HashStruct)
      @mixin = Module.new { def say_hi() end }
    end

    it "should inherit all mixins of HashStruct" do
      @hs.send(:include, @mixin)
      @struct = @hs.new(:first_name, :last_name)
      @struct.instance_methods.should include(:say_hi)
    end

    it "should be extended by all mixins of HashStruct" do
      @hs.extend(@mixin)
      @struct = @hs.new(:first_name, :last_name)
      @struct.methods.should include(:say_hi)
    end
  end
end
