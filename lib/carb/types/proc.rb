require "carb"
require "carb/types/base"

module Carb::Types
  Proc = Base::Proc.constrained(type: ::Proc)
end
