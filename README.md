# bindings

```bindings``` is a Ruby gem that allows the bindings of calling methods to be accessed without a C extension. It does this by using fiddle, Ruby's built-in support for accessing native C methods. Using this gem, you can easily access variables from calling methods, which makes it very easy to implement templating system or other utilities that need similar access.

## Usage

To access variables or other attributes of calling methods, just call ```binding.of_caller(n)``` where ```n``` is a number that represents how many callers back you are requesting.

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
    puts binding.of_caller(0).eval('local_variables') # c
    puts binding.of_caller(1).eval('local_variables') # b
    puts binding.of_caller(2).eval('local_variables') # a
    puts binding.of_caller(3).eval('local_variables') # outer
    puts binding.of_caller(9).eval('local_variables') rescue puts($!)
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
No such frame, gone beyond end of stack!
```

## License

This software is licensed under terms of the MIT License.
