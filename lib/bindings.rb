# =============================================================================
# bindings: Access bindings of calling methods (uses fiddle instead of C calls)
#
# Author: Steve Shreeve <steve.shreeve@gmail.com>
#   Date: June 13, 2015
#  Legal: MIT License
# =============================================================================

begin
  require 'bindings.so'
  return
rescue LoadError
end

require 'fiddle/import'

module Fiddle
  module Binding
    extend Fiddle::Importer
    dlload Fiddle.dlopen(nil)
    rb_debug_inspector_open              = extern "void* rb_debug_inspector_open(void*, void*)"
    rb_debug_inspector_frame_binding_get = extern "void* rb_debug_inspector_frame_binding_get(void*, long)"
    callback = bind("void* callback(void*, void*)") {|ctx, n| rb_debug_inspector_frame_binding_get.call(ctx, n+4)}
  end
end

class Binding
  def self.of_caller(n); ::Fiddle::Binding.rb_debug_inspector_open(::Fiddle::Binding['callback'], n).to_value; end
  def      of_caller(n); self.class.of_caller(n); end
end
