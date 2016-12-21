require "spec_helper"
require "carb/types/version"

describe Carb::Types do
  it "has a version number" do
    expect(Carb::Types::VERSION).to be_a String
  end
end
