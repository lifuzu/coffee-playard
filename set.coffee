# For ad-hoc set features, it sometimes makes sense to use hashes directly,
# rather than abstract to this level, but I'm showing a somewhat heavy
# solution to show off CoffeeScript class syntax.

# Reference: http://rosettacode.org/wiki/Set#CoffeeScript

class Set    
  constructor: (elems...) ->
    @hash = {}
    for elem in elems
      @hash[elem] = true
 
  add: (elem) ->
    @hash[elem] = true
 
  remove: (elem) ->
    delete @hash[elem]
 
  has: (elem) ->
    @hash[elem]?
 
  union: (set2) ->
    set = new Set()
    for elem of @hash
      set.add elem
    for elem in set2.to_array()
      set.add elem
    set
 
  intersection: (set2) ->
    set = new Set()
    for elem of @hash
      set.add elem if set2.has elem
    set
 
  minus: (set2) ->
    set = new Set()
    for elem of @hash
      set.add elem if !set2.has elem
    set
 
  is_subset_of: (set2) ->
    for elem of @hash
      return false if !set2.has elem
    true
 
  equals: (set2) ->
    this.is_subset_of(set2) and set2.is_subset_of this
 
  to_array: ->
    (elem for elem of @hash)
 
  each: (f) ->
    for elem of @hash
      f(elem)
 
  to_string: ->
    @to_array()
 
run_tests = ->
  set1 = new Set("apple", "banana") # creation
  console.log set1.has "apple" # true (membership)
  console.log set1.has "worms" # false (membership)
 
  set2 = new Set("banana", "carrots")
  console.log set1.union(set2).to_string() # [ 'apple', 'banana', 'carrots' ] (union)
  console.log set1.intersection(set2).to_string() # [ 'banana' ] (intersection)
  console.log set1.minus(set2).to_string() # [ 'apple' ] (difference)
 
  set3 = new Set("apple")
  console.log set3.is_subset_of set1 # true
  console.log set3.is_subset_of set2 # false
 
  set4 = new Set("apple", "banana")
  console.log set4.equals set1 # true
  console.log set4.equals set2 # false
 
  set5 = new Set("foo")
  set5.add "bar" # add
  console.log set5.to_string() # [ 'foo', 'bar' ]
  set5.remove "bar" # remove
  console.log set5.to_string() # [ 'foo' ]
 
  # iteration, prints apple then banana (order not guaranteed)
  set1.each (elem) ->
    console.log elem

  # set array
  setarr = [ new Set("apple", "banana"), new Set("a", "b") ]
  console.log setarr[0].to_string()
  console.log setarr[1].to_string()


class main
  print = console.log
  #set = new Set
  constructor: ->
    #@Graph = new Set(1, 2, 3, 4, 5, 6, 7, 8, 9) 
    @Graph = [1, 2, 3, 4, 5, 6, 7, 8, 9]

    @Neighbors = [
      [2, 4, 5, 6, 8],            # 1
      [1, 3, 4, 5, 6, 7, 9],      # 2
      [2, 4, 5, 6, 8],            # 3
      [1, 2, 3, 5, 7, 8, 9],      # 4
      [1, 2, 3, 4, 6, 7, 8, 9],   # 5
      [1, 2, 3, 5, 7, 8, 9],      # 6
      [2, 4, 5, 6, 8],            # 7
      [1, 3, 4, 5, 6, 7, 9],      # 8
      [2, 4, 5, 6, 8]             # 9
    ]

    @Solutions = [0, 0, 0,  0, 0, 0,  0, 0, 0]

  scan: (graph, node, position) ->
    @Solutions[position] += 1
    subgraph = graph.filter ( elem ) -> elem isnt node
    #print subgraph

    for inode in @Neighbors[node - 1]
      if inode in subgraph
        @scan subgraph, inode, position + 1

  run: ->
    for node in @Graph
      print node
      @scan @Graph, node, 0

    print @Solutions

#run_tests()
m = new main()
m.run()
