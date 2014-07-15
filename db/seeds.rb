# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Team.create!(
  name: 'F.C. Barcelona',
  code: 'FCB',
  color1: '#0200ab',
  color2: '#aa0000'
)
Team.create!(
  name: 'Real Madrid',
  code: 'MAD',
  color1: '#ffffff',
  color2: '#ffffff'
)
Team.create!(
  name: 'Manchester United',
  code: 'MAN',
  color1: '#CC0000',
  color2: '#CC0000'
)
Team.create!(
  name: 'Manchester City',
  code: 'CIT',
  color1: '#66CCFF',
  color2: '#66CCFF'
)
Team.create!(
  name: 'A.C. Milan',
  code: 'MIL',
  color1: '#CC0000',
  color2: '#000000'
)
Team.create!(
  name: 'Inter Milan',
  code: 'INT',
  color1: '#003399',
  color2: '#000000'
)