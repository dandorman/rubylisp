require "lisp"

describe "Reader" do
  let(:reader) { Lisp::Reader.new }

  it "returns a number when it reads a number" do
    result = reader.read "7"
    expect(result).to eq 7
  end

  it "returns the string when it reads an identifier" do
    result = reader.read "*"
    expect(result).to eq "*"
  end

  it "returns a list when it reads a simple form" do
    result = reader.read "(+ 1 2)"
    expect(result).to eq ["+", 1, 2]
  end

  it "returns a nested list when it reads a nested form" do
    result = reader.read "(* (+ 1 2) (+ 3 4))"
    expect(result).to eq ["*", ["+", 1, 2], ["+", 3, 4]]
  end
end
