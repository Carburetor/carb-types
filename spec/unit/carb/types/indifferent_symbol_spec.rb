require "spec_helper"
require "dry-types"
require "carb/types/indifferent_symbol"

describe Carb::Types::IndifferentSymbol do
  before do
    @type = Carb::Types::IndifferentSymbol
  end

  it "is valid with valid string" do
    expect(@type["foo"]).to eq :foo
  end

  it "is valid with empty string" do
    expect(@type[""]).to eq :""
  end

  it "is invalid with nil" do
    expect{@type[nil]}.to raise_error Dry::Types::ConstraintError
  end
end
