require "lisp"

describe "REPL" do
  it "prints the number when it reads a number" do
    repl = Lisp::REPL.new
    result = repl << "7"
    expect(result).to eq "7"
  end

  it "prints the identifier when it reads an identifier" do
    repl = Lisp::REPL.new
    result = repl << "+"
    expect(result).to eq "+"
  end

  it "prints the sum when it reads a simple addition form" do
    repl = Lisp::REPL.new
    result = repl << "(+ 1 2)"
    expect(result).to eq "3"
  end

  it "prints the product when it reads a nested multiplication form" do
    repl = Lisp::REPL.new
    result = repl << "(* (+ 1 2) (+ 3 4))"
    expect(result).to eq "21"
  end
end
