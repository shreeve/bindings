# =============================================================================
# bindings: Access bindings of calling methods (uses fiddle instead of C calls)
#
# Author: Steve Shreeve <steve.shreeve@gmail.com>
#   Date: June 13, 2015
#  Legal: MIT License
# =============================================================================

require 'fiddle/import'

module Fiddle
  module Binding
    extend Fiddle::Importer

    dlload Fiddle.dlopen(nil)

    extern "void* rb_debug_inspector_open(void*, void*)"
    bind("void* callback(void*, void*)") {|ptr, _| DebugStruct.new(ptr).contexts }

    DebugStruct = struct [
      "void* thread",
      "void* frame",
      "void* backtrace",
      "void* contexts",
      "long  backtrace_size"
    ]

    class << self
      def callers
        list = rb_debug_inspector_open(self['callback'], nil).to_value
        list.drop(4).map {|ary| ary[2]}
      end
    end
  end
end

class ::Binding
  def of_caller(n)
    c = ::Fiddle::Binding.callers
    n < c.size or raise "No such frame, gone beyond end of stack!"
    c[n]
  end
end
