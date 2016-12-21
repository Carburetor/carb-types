require "spec_helper"
require "dry-types"
require "carb/types/array_of_indifferent_symbols"

describe Carb::Types::ArrayOfIndifferentSymbols do
  before do
    @type = Carb::Types::ArrayOfIndifferentSymbols
  end

  it "is valid with valid strings" do
    expect(@type[["foo"]]).to eq [:foo]
  end

  it "is valid with empty array" do
    expect(@type[[]]).to eq []
  end

  it "is invalid with invalid IndifferentSymbol content" do
    expect{@type[[123]]}.to raise_error Dry::Types::ConstraintError
  end
end
