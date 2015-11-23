module Plotter
  module Node
    class Base
      class << self
        attr_reader :attributes

        def set_attributes(*attrs)
          @attributes = attrs
          attr_reader *attrs
        end
      end

      def ==(other)
        self.class == other.class && self.attributes == other.attributes
      end

      def attributes
        self.class.attributes.each_with_object({}) { |attr, hash| hash[attr] = send(attr) }
      end
    end
  end
end
