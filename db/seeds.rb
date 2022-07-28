# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
Payer.create([
    { payer: "DANNON", points: 0 },
    { payer: "UNILEVER", points: 0 },
    { payer: "MILLER COORS", points: 0 }
])

Transaction.create([
    { payer: Payer.first[:payer], points: 1000, timestamp: "2020-11-02T14:00:00Z" },
    { payer: Payer.second[:payer], points: 200, timestamp: "2020-10-31T11:00:00Z" },
    { payer: Payer.first[:payer], points: -200, timestamp: "2020-10-31T15:00:00Z" },
    { payer: Payer.third[:payer], points: 10000, timestamp: "2020-11-01T14:00:00Z" },
    { payer: Payer.first[:payer], points: 300, timestamp: "2020-10-31T10:00:00Z" }
])

User.create({points: 5000})