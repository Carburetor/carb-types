require "spec_helper"
require "dry-types"
require "carb/types/proc"

describe Carb::Types::Proc do
  before do
    @type = Carb::Types::Proc
  end

  it "is invalid when is not a Proc" do
    expect{@type[123]}.to raise_error Dry::Types::ConstraintError
  end

  it "is valid when is a Proc" do
    mth = -> {}

    expect(@type[mth]).to eq mth
  end
end
