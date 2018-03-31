##### Fibonacci using for loop - 1st way

```ruby
array = [0,1]

for i in 0..20 do
  array << array[-1] + array[-2]
end

array[20]
```

##### Fibonacci using for loop - 2nd  way

```ruby
first = 0
second = 1

for i in 0..20 do
  chosen = first + second
  first = second
  second = chosen
end

chosen
```

##### Fibocacci using recursion

```ruby
def fibonacci(number)
  n[i] + n[i+1] = n[i+2]
end
```
This is the heart of Fibonacci - the sum first and second element gives the third element.  
It's easy to see that a function can be written in a recursive way when there is a relationship between the past and future elements.

```ruby
def fibonacci(number)
  fibonacci(i) + fibonacci(i+1) = fibonacci(i+2)
end
```

Recursion means repetitiveness(recurrence) - we're going to use the same function. Instead of using a loop (like above),
we're using the function itself (with different arguments - see below).

As we're not using element's position (`[]` square brackets), but the function itself, we need to change `[]` to `()` - typical for functions.

The number passed in the main fibonacci function (`def fibonacci(number)`) is the number(position) in the fibonacci sequence that interests us (the 20th element). We don't care about other elements.

To each element (including 20th), applies the same rule - it's a sum of two previous elements.
Hence we can write it like that:

```ruby
def fibonacci(number)
  fibonacci(number-2) + fibonacci(number-1)
end

fibonacci(20)
```

The function in this form will go forever (try it!) - you'll kill your computer.
Right now fibonacci is not really fibonacci - it just tells us that we're interested in a sum of two previous calls.

We want to end our fibonacci once the first element (`fibonacci(number-2)`) will equal 0 and second (`fibonacci(number-1)`) will equal 1.
To end our recursion, we need to have stop condition. We know that the first element in fibonacci is 0 and so we want to stop there:

```ruby
fibonacci(0) == 0
```

Since our fibonacci method is using two positions at the same time (to sum them), we need to know the second last (second before the stop - second stop condition):

```ruby
fibonacci(1) == 1
```

Since we don't want our function to run forever, we need to use this stop condition using return.

```ruby
def fibonacci(number)
  if number == 0 then
    return 0
  end
  if number == 1 then
    return 1
  end
  return fibonacci(number-2) + fibonacci(number-1)
end

fibonacci(20)
```

Imagine running fibonacci(1) - position 1 in the sequence - it will simply return 1.
Now fibonacci(2) - since this number won't be stopped on either of stop conditions, it will go to `return fibonacci(number-2) + fibonacci(number-1)`.

First it will encounter `fibonacci(2-2)` - it will, according to

```ruby
if number == 0 then
  return 0
end
```

return 0. This 0 will be added to `fibonacci(2-1)`, which according to:

```ruby
if number == 1 then
  return 1
end
```

returns 1.

0 + 1 equals 1, and this is the third (2nd index) position in the fibonacci sequence.

[See example](/images/img.jpg)
