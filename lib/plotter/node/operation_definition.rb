module Plotter
  module Node
    class OperationDefinition < Base
      set_attributes :operation_type, :name, :selections

      VALID_OPERATION_TYPES = %w(query).map(&:freeze).freeze

      def initialize(operation_type:, name:, selections:)
        raise "Bad operation type: #{operation_type.inspect}" unless VALID_OPERATION_TYPES.include?(operation_type)

        @operation_type = operation_type.to_sym
        @name = name
        @selections = selections
      end
    end
  end
end
