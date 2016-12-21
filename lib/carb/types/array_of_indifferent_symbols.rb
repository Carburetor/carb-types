require "dry-types"
require "carb"
require "carb/types/core"
require "carb/types/indifferent_symbol"

module Carb::Types
  ArrayOfIndifferentSymbols = Core::Coercible::Array.member(IndifferentSymbol)
end
