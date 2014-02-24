class AndroidLockScreenPattern
  constructor: ->
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

    for inode in @Neighbors[node - 1]
      if inode in subgraph
        @scan subgraph, inode, position + 1

  run: ->
    for node in @Graph
      @scan @Graph, node, 0

    console.log @Solutions

alsp = new AndroidLockScreenPattern()
alsp.run()
