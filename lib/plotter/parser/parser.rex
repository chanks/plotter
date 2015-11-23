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

  # keywords
              query         { [:QUERY, :query] }
              mutation      { [:MUTATION, :mutation] }

  # tokens
              \{            { [:left_bracket, text] }
              \}            { [:right_bracket, text] }
              ,             { [:comma, text] }

  # names
              {NAME}        { [:name, text] }
