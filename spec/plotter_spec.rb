require 'spec_helper'

class PlotterSpec < Minitest::Spec
  def parse(string)
    Plotter.parse(string)
  end

  it "has a version number" do
    refute_nil ::Plotter::VERSION
  end

  it "should be able to turn a simple query into an AST" do
    result =
      parse <<-GRAPHQL
        query myQueryName {
          user {
            id,
            name
          }
        }
      GRAPHQL

    expected =
      Plotter::Node::Document.new(
        parts: [
          Plotter::Node::OperationDefinition.new(
            operation_type: :query,
            name: 'myQueryName',
            selections: [
              Plotter::Node::Field.new(
                name: 'user',
                selections: [
                  Plotter::Node::Field.new(name: 'id'),
                  Plotter::Node::Field.new(name: 'name'),
                ]
              )
            ]
          )
        ]
      )

    assert_equal expected, result
  end

  it "should handle the common schema introspection query"

  it "should ignore comments"
end
