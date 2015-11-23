module Plotter
  module Node
    class Document < Base
      set_attributes :parts

      def initialize(parts:)
        @parts = parts
      end
    end
  end
end
