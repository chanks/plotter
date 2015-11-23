module Plotter
  module Node
    class FragmentSpread < Base
      set_attributes :name

      def initialize(name:)
        @name = name
      end
    end
  end
end
