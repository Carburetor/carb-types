require "active_support/core_ext/hash/keys"
require "carb"
require "carb/types/core"

module Carb::Types
  StringHash = Core::Coercible::Hash.constructor do |input|
    input.to_h.deep_stringify_keys
  end
end

