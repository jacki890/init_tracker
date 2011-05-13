require 'rubygems'
require 'data_mapper'
require 'init_tracker'

DataMapper.setup(:default, 'postgres://localhost/init_track_db')
