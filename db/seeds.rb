# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require "csv"

# testData
# CSV.foreach('db/seeds/csv/testHambarger.csv', headers: true) do |row|
#   TestHambarger.create(
#     name: row['name'],
#     price: row['price'],
#     calorie: row['calorie'],
#     protein: row['protein'],
#     fat: row['fat'],
#     carbohydrate: row['carbohydrate'],
#     dietary_fiber: row['dietary_fiber']
#   )
# end

# MorningMenu
CSV.foreach('db/seeds/csv/MorningMenu.csv', headers: true) do |row|
  MorningMenu.create(
    size: row['size'],
    name: row['name'],
    price: row['price'],
    calorie: row['calorie'],
    protein: row['protein'],
    fat: row['fat'],
    carbohydrate: row['carbohydrate'],
    dietary_fiber: row['dietary_fiber'],
    isSet: row['isSet'],
    isSetNoSide: row['isSetNoSide'],
    isConb: row['isConb'],
    category: row['category']
  )
end

# LunchMenu
CSV.foreach('db/seeds/csv/LunchMenu.csv', headers: true) do |row|
  LunchMenu.create(
    size: row['size'],
    name: row['name'],
    price: row['price'],
    calorie: row['calorie'],
    protein: row['protein'],
    fat: row['fat'],
    carbohydrate: row['carbohydrate'],
    dietary_fiber: row['dietary_fiber'],
    isSet: row['isSet'],
    isValueSet: row['isValueSet'],
    isValueConb: row['isValueConb'],
    category: row['category']
  )
end

# DinnerMenu
CSV.foreach('db/seeds/csv/DinnerMenu.csv', headers: true) do |row|
  DinnerMenu.create(
    size: row['size'],
    name: row['name'],
    price: row['price'],
    calorie: row['calorie'],
    protein: row['protein'],
    fat: row['fat'],
    carbohydrate: row['carbohydrate'],
    dietary_fiber: row['dietary_fiber'],
    isSet: row['isSet'],
    category: row['category']
  )
end