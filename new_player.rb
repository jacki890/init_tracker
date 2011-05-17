# Adding a new player character to the database.

  include DataMapper::Resource

  property :id, Serial
  property :name, String
  property :race, String
  property :hp, Integer
  property :class, String
  property :level, Integer
  property :gender, String
  property :alignment, String
  property :ac, Integer
  property :ac_type, String
