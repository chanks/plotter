class Plotter::Parser

option
  ignorecase

macro
  NAME    \w+
  BLANK   \s+

rule
  # [:state]  pattern       [actions]

  # skip
              {BLANK}       # no action

  # tokens
              \{            { [:left_bracket, text] }
              \}            { [:right_bracket, text] }
              ,             { [:comma, text] }

  # names
              \.\.\.{NAME}  { [:fragment_name, text[3..-1]] }
              {NAME}        { [:name, text] }
