require "dry-types"
require "carb"
require "carb/types/core"

module Carb::Types
  IndifferentSymbol = Core::Strict::Symbol.constructor do |input|
    unless input.respond_to?(:to_sym)
      raise Dry::Types::ConstraintError.new("#to_sym", input)
    end
    input.to_sym
  end
  ArrayOfIndifferentSymbols = Core::Coercible::Array.member(IndifferentSymbol)
end
