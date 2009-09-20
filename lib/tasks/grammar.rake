namespace :grammar do
  desc 'Generate RoboHeroParser grammar'
  task :generate do
    puts `tt grammars/robo_hero_parser.treetop -o lib/robo_hero_parser.rb`
  end
end
