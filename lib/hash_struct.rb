# encoding: utf-8

class HashStruct
  # User  = HashStruct.new(:first_name, :last_name)
  # @user = User.new(first_name: "Jakub", last_name: "Stastny")
  def self.new(*attributes)
    raise ArgumentError, "you have to specify some attributes" if attributes.empty?
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
    end
  end
end
