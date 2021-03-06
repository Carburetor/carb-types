require "carb"
require "carb/types/core"

module Carb::Types
  UUID = Core::Strict::String.constrained(
    format: /
      \A[0-9a-fA-F]{8}
      -[0-9a-fA-F]{4}
      -4[0-9a-fA-F]{3}
      -[89abAB][0-9a-fA-F]{3}
      -[0-9a-fA-F]{12}\z
    /ix
  )
end
