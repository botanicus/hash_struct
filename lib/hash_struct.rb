# encoding: utf-8

class HashStruct
  # User  = HashStruct.new(:first_name, :last_name)
  # @user = User.new(first_name: "Jakub", last_name: "Stastny")
  def self.new(*attributes)
    raise ArgumentError, "you have to specify some attributes" if attributes.empty?

    included = self.included_modules
    extended = (class << self; self; end).included_modules

    Class.new do
      # setup accessors
      attributes.each do |attribute|
        attr_accessor attribute
      end

      # initialize
      def initialize(attributes = Hash.new)
        attributes.each do |attribute, value|
          self.send("#{attribute}=", value)
        end
      end

      # NOTE: second possible implementation (maybe better) is Class.new(self)
      # but then we have to used the original new method, so the object will be properly created
      # include modules
      (included - self.included_modules).each do |mixin|
        self.send(:include, mixin)
      end

      # extended modules
      (extended - (class << self; self; end).included_modules).each do |mixin|
        self.extend(mixin)
      end
    end
  end
end
