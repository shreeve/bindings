# bindings

```bindings``` is a Ruby gem that allows the bindings of calling methods to be accessed. Using this gem, you can easily access variables from calling methods, which makes it very easy to implement templating systems or other utilities that need similar access.

## Usage

To access variables or other attributes of calling methods, just call ```Binding.of_caller(n)``` where ```n``` is a number that represents how many callers back you are requesting.

## Example

```ruby
outer = 40

class A
  def a
    a = 30
    B.new.b
  end
end

class B
  def b
    b = 20
    C.new.c
  end
end

class C
  def c
    c = 10
    puts Binding.of_caller(0).eval('local_variables') # c
    puts Binding.of_caller(1).eval('local_variables') # b
    puts Binding.of_caller(2).eval('local_variables') # a
    puts Binding.of_caller(3).eval('local_variables') # outer
    puts Binding.of_caller(999).eval('local_variables') rescue puts($!)
  end
end

A.new.a
```

## Result

```
c
b
a
outer
no such frame
```

## License

This software is licensed under terms of the MIT License.
