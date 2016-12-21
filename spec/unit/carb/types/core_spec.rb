require "spec_helper"
require "dry-types"
require "carb/types/core"

describe Carb::Types::Core do
  before do
    @types = Carb::Types::Core
  end

  it "creates a type definition" do
    expect(@types.type_define(::Proc)).to be_a Dry::Types::Definition
  end
end
