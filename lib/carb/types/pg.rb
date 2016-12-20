require "pg"
require "sequel"
require "carb"

Sequel.extension(:pg_json_ops, :pg_array_ops, :pg_json, :pg_array)

module Carb::Types
  module PG
  end
end

require "carb/types/pg/raw"
require "carb/types/pg/core"
