require "dry-types"
require "pg"
require "sequel"
require "carb"
require "carb/types/pg"
require "carb/types/core"

Sequel.extension(:pg_json_ops, :pg_array_ops, :pg_json, :pg_array)

module Carb::Types::PG
  module Raw
    def self.type_define(klass)
      Dry::Types::Definition[klass].new(klass)
    end

    UUID       = ::Carb::Types::Core::String
    Array      = type_define(Sequel::Postgres::PGArray)
    JSONArray  = type_define(Sequel::Postgres::JSONArray)
    JSONHash   = type_define(Sequel::Postgres::JSONHash)
    JSONOp     = type_define(Sequel::Postgres::JSONOp)
    JSON       = JSONArray | JSONHash | JSONOp
    JSONBArray = type_define(Sequel::Postgres::JSONBArray)
    JSONBHash  = type_define(Sequel::Postgres::JSONBHash)
    JSONBOp    = type_define(Sequel::Postgres::JSONBOp)
    JSONB      = JSONBArray | JSONBHash | JSONBOp
    Bytea      = type_define(Sequel::SQL::Blob)
    Money      = ::Carb::Types::Core::Decimal
  end
end
