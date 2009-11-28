# encoding: utf-8

class HashStruct
  # User  = HashStruct.generate(:first_name, :last_name)
  # @user = User.new(first_name: "Jakub", last_name: "Stastny")
  def self.generate(*attributes)
    raise ArgumentError, "you have to specify some attributes" if attributes.empty?

    included = self.included_modules
    extended = (class << self; self; end).included_modules

    Class.new(self) do
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
    end
  end
end
