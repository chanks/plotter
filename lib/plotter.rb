require 'plotter/version'

require 'plotter/node/base'
require 'plotter/node/document'
require 'plotter/node/field'
require 'plotter/node/fragment_spread'
require 'plotter/node/operation_definition'

module Plotter
  class << self
    def parse(string)
      Parser.parse(string)
    end
  end
end

require 'plotter/parser/parser.racc.rb'
