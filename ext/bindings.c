#include "ruby/ruby.h"
#include "ruby/debug.h"

static VALUE
callback(const rb_debug_inspector_t *dbg_context, void *data)
{
  long item = NUM2LONG(*((VALUE *)data));
  return rb_debug_inspector_frame_binding_get(dbg_context, item + 1);
}

static VALUE
of_caller(VALUE self, VALUE item)
{
  return rb_debug_inspector_open(callback, (void *) &item);
}

void
Init_bindings(VALUE self)
{
  VALUE cBinding = rb_define_class("Binding", rb_cObject);
  rb_define_singleton_method(cBinding, "of_caller", of_caller, 1); /* preferred */
  rb_define_method(cBinding, "of_caller", of_caller, 1); /* backward compatibility */
}
