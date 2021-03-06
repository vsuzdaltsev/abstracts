# Abstract module
module Abstract
  # Extensions
  module Extensions
    # Object extensions
    module Object
      # Check if object is blank
      # @return [Trueclass, FalseClass] - is object nil or empty
      def blank?
        respond_to?(:empty?) && empty? || !self
      end

      # Add default proc to Hash
      # @return [Hash] - Hash with default proc
      def default_hash
        Hash.new do |hash, key|
          hash[key] = Hash.new(&hash.default_proc)
        end
      end
    end
  end

  # Abstract::Object class
  class Object
    # Get an array of attr_accessor names
    # @return [Array] - Array of attribute accessor methods
    def attrs
      self.class.instance_eval do
        @attrs.each do |attr|
          attr_accessor attr
        end
      end
    end
  end

  # Abstract::Builder class
  class Builder
    attr_reader :object

    # Create an instance of Abstract::Object class and yield block to it
    # @return [AbstractObject] - Abstract::Object class instance
    def self.build
      builder = new(@build_class)
      yield builder if block_given?
      builder.object
    end

    # Define attribute writers to Abstract::Builder instance according to
    #   existing accessors of Abstract::Object instance
    # @param object [String] - Abstract::Object.class.name
    # @return [Abstract::Builder] - builder object
    def initialize(object)
      @object = Class.const_get(object).new
      @object.attrs.each do |attr|
        define_singleton_method "#{attr}=" do |param|
          @object.public_send("#{attr}=", param)
        end
      end
    end
  end
end
