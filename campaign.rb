require 'rubygems'
require 'data_mapper'
require 'setup'

class Campaign
  include DataMapper::Resource

  property :id, Serial
  property :name, String
  property :description, String

  def to_s
    "#{id} #{name}"
  end
end
