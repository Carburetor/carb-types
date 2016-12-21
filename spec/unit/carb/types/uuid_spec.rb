require "spec_helper"
require "dry-types"
require "securerandom"
require "carb/types/uuid"

describe Carb::Types::UUID do
  before do
    @type = Carb::Types::UUID
  end

  it "is invalid with random text" do
    expect{@type["foo"]}.to raise_error Dry::Types::ConstraintError
  end

  it "is valid with real UUID" do
    uuid = SecureRandom.uuid

    expect(@type[uuid]).to eq uuid
  end
end
