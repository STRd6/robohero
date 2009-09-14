desc 'Import cards into db from csv files'
task :import_cards => :environment do
  CardImporter.import_all
end

desc 'Initialize RoboHero data'
task :init_data => :import_cards do
  Robot.import_default_robots
end
