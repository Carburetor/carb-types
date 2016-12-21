require "spec_helper"
require "dry-types"
require "sequel"
require "carb/types/pg/core"

describe Carb::Types::PG do
  before do
    @types = Carb::Types::PG
  end

  it "is a valid postgres string array" do
    expect(@types::StringArray[["foo"]]).to be_a Sequel::Postgres::PGArray
  end

  it "is a valid postgres jsonb array" do
    expect(@types::JSONBArray[["foo"]]).to be_a Sequel::Postgres::JSONBArray
  end

  it "is a valid postgres jsonb hash" do
    expect(@types::JSONBHash[{ "f" => 1 }]).to be_a Sequel::Postgres::JSONBHash
  end

  it "is a valid postgres jsonb basic type" do
    expect(@types::JSONBOp["foo"]).to be_a Sequel::Postgres::JSONBOp
  end

  it "is a valid postgres jsonb generic type" do
    expect(@types::JSONB["foo"]).to be_a Sequel::Postgres::JSONBOp
  end

  it "is a valid postgres blob" do
    expect(@types::Bytea["foo"]).to be_a Sequel::SQL::Blob
  end

  it "is valid postgres jsonb hash when object responds to #to_h" do
    obj = double("Hash-like", to_h: { "foo" => "bar" })

    coerced = @types::CoercibleJSONBHash[obj]

    expect(coerced).to be_a Sequel::Postgres::JSONBHash
  end

  it "is a valid tsvector" do
    tsvectored = @types::Tsvector["foo"]

    expect(tsvectored).to be_a Sequel::SQL::Function
    expect(tsvectored.name).to eq :to_tsvector
  end
end
