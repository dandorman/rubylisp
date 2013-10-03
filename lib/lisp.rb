require "treetop"
Treetop.load File.join(__dir__, "lisp")

module Lisp
  class REPL
    def <<(string)
      expression = Reader.new.read string
      result = Evaluator.new.evaluate expression
      result.to_s
    end
  end

  class Reader
    def read(string)
      parser = LispParser.new
      parse_tree = parser.parse string
      parse_tree.to_lisp
    end
  end

  class Evaluator
    def evaluate(expression)
      if expression.is_a? Array
        operator, *values = expression
        values.map { |value| evaluate value }.reduce(operator)
      else
        expression
      end
    end
  end
end
