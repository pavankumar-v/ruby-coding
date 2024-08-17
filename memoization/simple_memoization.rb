add = -> (n) { n + 10 }

p 'simple add', add.call(3)

# simple memoization

memoize = lambda do |fun|
  cache = {}

  return -> (*args) {
    n = args[0]

    if cache[n]
      p 'from cache'
      return cache[n]
    else
      res = fun.call(n)
      cache[n] = res 
      return res
    end
  }
end

# creating memoized fun 
memoizedAdd = memoize.call(add);
p memoizedAdd.call(3)
p memoizedAdd.call(3)
p memoizedAdd.call(4)
p memoizedAdd.call(4)