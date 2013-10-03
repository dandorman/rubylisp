require "lisp"

describe "Evaluator" do
  let(:evaluator) { Lisp::Evaluator.new }

  it "returns a number when it evaluates a number" do
    result = evaluator.evaluate 42
    expect(result).to eq 42
  end

  it "returns the identifier when it evaluates an identifier" do
    result = evaluator.evaluate "*"
    expect(result).to eq "*"
  end

  it "returns the sum when it evaluates a simple addition form" do
    result = evaluator.evaluate ["+", 1, 2]
    expect(result).to eq 3
  end

  it "returns the product when it evaluates a nested multiplication form" do
    result = evaluator.evaluate ["*", ["+", 1, 2], ["+", 3, 4]]
    expect(result).to eq 21
  end
end
