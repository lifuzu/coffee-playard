weatherReport = (location) ->
  [location, 72, "Mostly sunny"]

[city, temp, forecast] = weatherReport "Berkeley, CA"

console.log weatherReport 'Berkeley, CA'

print = (x) ->
  console.log x

futurists =
  sculptor: "Umberto Boccioni"
  painter: "Vladimir Burliuk"
  poet:
    name: "F.T. Marinetti"
    address: [
      "Via Roma 42R"
      "Bellagio, Italy 22021"
    ]

{poet: {name, address: [street, city]}} = futurists

print futurists
print {poet: {name, address: [street, city]}}

tag = "<impossible>"
[open, contents..., close] = tag.split("")

print contents

class Person
  constructor: (options) ->
    {@name, @age, @height} = options

tim = new Person age: 4

print tim.age