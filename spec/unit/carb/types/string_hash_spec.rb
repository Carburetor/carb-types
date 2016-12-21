require "spec_helper"
require "dry-types"
require "carb/types/string_hash"

describe Carb::Types::StringHash do
  before do
    @type = Carb::Types::StringHash
  end

  it "is a hash with all strings as keys" do
    expect(@type[{ foo: "bar" }]).to eq({ "foo" => "bar" })
  end
end
