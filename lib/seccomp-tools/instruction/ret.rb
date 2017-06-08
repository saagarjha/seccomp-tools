require 'seccomp-tools/instruction/base'

module SeccompTools
  module Instruction
    # Instruction ret.
    class RET < Base
      # Decompile instruction.
      def decompile
        return 'return A' if code & 0x18 == SRC[:a]
        "return #{ACTION.invert[k & 0x7fff0000]}"
      end

      # See {Base#branch}.
      # @return [[]]
      #   Always return an empty array.
      def branch(*)
        []
      end
    end
  end
end
