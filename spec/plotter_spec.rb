require 'spec_helper'

class PlotterSpec < Minitest::Spec
  it "has a version number" do
    refute_nil ::Plotter::VERSION
  end
end
