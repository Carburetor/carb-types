require "dry-types"
require "pg"
require "sequel"
require "carb"
require "carb/types/pg"
require "carb/types/core"

Sequel.extension(:pg_json_ops, :pg_array_ops, :pg_json, :pg_array)

module Carb::Types::PG
  module Raw
    types      = ::Carb::Types::Core

    UUID       = types::String
    Array      = types.type_define(Sequel::Postgres::PGArray)
    JSONArray  = types.type_define(Sequel::Postgres::JSONArray)
    JSONHash   = types.type_define(Sequel::Postgres::JSONHash)
    JSONOp     = types.type_define(Sequel::Postgres::JSONOp)
    JSON       = JSONArray | JSONHash | JSONOp
    JSONBArray = types.type_define(Sequel::Postgres::JSONBArray)
    JSONBHash  = types.type_define(Sequel::Postgres::JSONBHash)
    JSONBOp    = types.type_define(Sequel::Postgres::JSONBOp)
    JSONB      = JSONBArray | JSONBHash | JSONBOp
    Bytea      = types.type_define(Sequel::SQL::Blob)
    Money      = types::Decimal
  end
end
