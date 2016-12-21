require "carb"
require "dry-types"

module Carb::Types
  module Core
    include Dry::Types.module

    def self.type_define(klass)
      Dry::Types::Definition[klass].new(klass)
    end
  end
end
