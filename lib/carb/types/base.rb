require "carb"
require "dry-types"

module Carb::Types
  module Base
    Proc = Dry::Types::Definition[::Proc].new(::Proc)
  end
end
