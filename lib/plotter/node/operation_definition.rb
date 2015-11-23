module Plotter
  module Node
    class OperationDefinition < Base
      set_attributes :operation_type, :name, :selections

      def initialize(operation_type:, name:, selections:)
        @operation_type = operation_type
        @name = name
        @selections = selections
      end
    end
  end
end
