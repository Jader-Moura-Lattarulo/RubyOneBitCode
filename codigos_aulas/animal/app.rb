require_relative 'animal.rb'
require_relative 'cachorro.rb'

puts "--Animal--"
animal = Animal.new
animal.pular

puts "--Cachorro--"
cachorro = Cachorro.new
cachorro.pular
cachorro.latir 