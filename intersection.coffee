    intersection = (a, b) ->
      [a, b] = [b, a] if a.length > b.length
      value for value in a when value in b

    x = ["hello", "two", "three"]
    y = ["hello"]
    
    console.log(intersection x, y)
