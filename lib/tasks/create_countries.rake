require 'csv'

CSV_DATA_DIR = File.join(RAILS_ROOT, "db","csv")

task :create_countries => [:environment] do
  CSV.read(File.join(CSV_DATA_DIR, 'countries.txt')).each do |line|
    country = Country.create({:name => line[0],:code => line[1]})
  end
end
