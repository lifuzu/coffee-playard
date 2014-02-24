list = [1,2,3,4,5]
square = (x) -> x*x
math = 
  root: Math.sqrt
  square: square
  cube: (x) -> x* square x


race = (winner, runners...) ->
  console.log winner + ' ' + runners

race 'hello', 'world!'

cubes = ( math.cube num for num in list)
console.log cubes

print = (x)-> console.log x

print cubes

fill = (container, liquid = "coffee") ->
  print "Filling the #{container} with the #{liquid}..."

fill 'lid', 'water'

countdown = (num for num in [10..1])

print countdown

countdown = ->
  (num for num in [10..1])

print countdown()

yearsOld = max: 19, ida: 9, tim: 11

ages = -> 
  for child, age of yearsOld
    "#{child} is #{age}"

print ages()
