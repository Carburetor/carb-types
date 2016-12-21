require "pg"
require "sequel"
require "carb"
require "carb/types/core"
require "carb/types/pg"
require "carb/types/pg/raw"

Sequel.extension(:pg_json_ops, :pg_array_ops, :pg_json, :pg_array)

module Carb::Types::PG
  # Array
  def self.Array(db_type)
    Raw::Array.constructor(
      ->(array) { Sequel.pg_array(array, db_type) }
    ).meta(type: db_type)
  end

  StringArray = Raw::Array.constructor(
    ->(input) { Sequel.pg_array(input.map(&:to_s), :text) }
  ).meta(type: :text)

  # JSONB
  JSONBArray = Raw::JSONBArray.constructor(Sequel.method(:pg_jsonb))
  JSONBHash  = Raw::JSONBHash.constructor(Sequel.method(:pg_jsonb))
  JSONBOp    = Raw::JSONBOp.constructor(Sequel.method(:pg_jsonb))
  JSONB      = JSONBArray | JSONBHash | JSONBOp
  Bytea      = Raw::Bytea.constructor(Sequel::SQL::Blob.method(:new))

  CoercibleJSONBHash = Raw::JSONBHash.constructor(
    ->(input) { Sequel.pg_jsonb(input.to_h) }
  )

  # Tsvector
  Tsvector = ::Carb::Types::Core::Coercible::String.constructor(
    ->(input) { Sequel.function(:to_tsvector, input.to_s) }
  )
end
