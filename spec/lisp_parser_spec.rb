require "lisp"

describe "LispParser" do
  let(:parser) { Lisp::LispParser.new }

  it "returns a number when it reads a number" do
    parse_tree = parser.parse "7"
    expect(parse_tree.to_lisp).to eq 7
  end

  it "returns the string when it reads an identifier" do
    parse_tree = parser.parse "*"
    expect(parse_tree.to_lisp).to eq "*"
  end

  it "returns a list when it reads a simple form" do
    parse_tree = parser.parse "(+ 1 2)"
    expect(parse_tree.to_lisp).to eq ["+", 1, 2]
  end

  it "returns a nested list when it reads a nested form" do
    parse_tree = parser.parse "(* (+ 1 2) (+ 3 4))"
    expect(parse_tree.to_lisp).to eq ["*", ["+", 1, 2], ["+", 3, 4]]
  end
end
