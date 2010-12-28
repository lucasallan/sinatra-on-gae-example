#run lambda {Rack::Response.new('Hello').finish}
require 'post'
run Sinatra::Application
