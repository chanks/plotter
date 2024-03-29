#--
# DO NOT MODIFY!!!!
# This file is automatically generated by rex 1.0.5
# from lexical definition file "lib/plotter/parser/parser.rex".
#++

require 'racc/parser'
class Plotter::Parser < Racc::Parser
  require 'strscan'

  class ScanError < StandardError ; end

  attr_reader   :lineno
  attr_reader   :filename
  attr_accessor :state

  def scan_setup(str)
    @ss = StringScanner.new(str)
    @lineno =  1
    @state  = nil
  end

  def action
    yield
  end

  def scan_str(str)
    scan_setup(str)
    do_parse
  end
  alias :scan :scan_str

  def load_file( filename )
    @filename = filename
    open(filename, "r") do |f|
      scan_setup(f.read)
    end
  end

  def scan_file( filename )
    load_file(filename)
    do_parse
  end


  def next_token
    return if @ss.eos?
    
    # skips empty actions
    until token = _next_token or @ss.eos?; end
    token
  end

  def _next_token
    text = @ss.peek(1)
    @lineno  +=  1  if text == "\n"
    token = case @state
    when nil
      case
      when (text = @ss.scan(/\s+/i))
        ;

      when (text = @ss.scan(/\{/i))
         action { [:left_bracket, text] }

      when (text = @ss.scan(/\}/i))
         action { [:right_bracket, text] }

      when (text = @ss.scan(/,/i))
         action { [:comma, text] }

      when (text = @ss.scan(/\.\.\.\w+/i))
         action { [:fragment_name, text[3..-1]] }

      when (text = @ss.scan(/\w+/i))
         action { [:name, text] }

      else
        text = @ss.string[@ss.pos .. -1]
        raise  ScanError, "can not match: '" + text + "'"
      end  # if

    else
      raise  ScanError, "undefined state: '" + state.to_s + "'"
    end  # case state
    token
  end  # def _next_token

end # class
