require 'rubygems'
require 'treetop'
require 'robohero'

parser = RoboHeroParser.new

result = parser.parse("(3C)(5EN): Destroy target weapon.")

result.cost_array