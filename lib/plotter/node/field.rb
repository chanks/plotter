module Plotter
  module Node
    class Field < Base
      EMPTY_SELECTION_LIST = [].freeze

      set_attributes :name, :selections

      def initialize(name:, selections: EMPTY_SELECTION_LIST)
        @name = name
        @selections = selections
      end
    end
  end
end
