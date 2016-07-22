require 'csv'
require 'yaml'
require 'pry'

headers =

File.open("trainers_2.yml", "w") do |f|
  CSV.foreach("data/Gaslight\ League\ -\ Sheet1.csv") do |row|
    binding.pry;
    f.write(row.to_yaml)
  end
end
