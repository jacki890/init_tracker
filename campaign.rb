class Campaign
  include DataMapper::Resource

  property :id, Serial
  property :name, String
  property :description, String

end
