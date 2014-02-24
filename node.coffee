delay = (ms, func) -> setTimeout func, ms
interval = (ms, func) -> setInterval func, ms
alert = (x) -> console.log x

class Thing
  constructor: ->
    @data = 42
  algo: ->
    delay 1000, =>
      alert "hello, #{@data}"
  print: ->
    interval 1000, =>
      alert "hello, #{@data}"

thing = new Thing
thing.algo()

thing.print()