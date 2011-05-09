require 'rubygems'
require 'init_tracker'
require 'data_mapper'

DataMapper.setup(:default, 'postgres://localhost/init_track_db')

it = InitTracker.new
it.write_file
