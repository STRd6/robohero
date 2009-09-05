desc 'Import cards into db from csv files'
task :import_cards => :environment do
  CardImporter.import_all
end