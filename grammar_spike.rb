require "treetop"
Treetop.load "lisp"

parser = LispParser.new
parse_tree = parser.parse "(* (+ 1 2) (+ 3 4)"
p parse_tree
