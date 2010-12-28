require 'sinatra'
require 'dm-core'

#configure datamapper for use app engine database
DataMapper.setup(:default, "appengine://auto")

#Model class
class Post 
    include DataMapper::Resource

    property :id, Serial
    property :title, String
    property :content, Text
    property :post_date, DateTime
end

# helpers

helpers do
  include Rack::Utils
  alias_method :h, :escape_html
end

# controllers
get '/' do
  @posts = Post.all
  erb :index
end

post '/post' do
  Post.create(:title => params[:title], :content => params[:content])
  redirect '/'
end

get '/post/new' do
    erb :new
end

get '/post/:post' do
    @post = Post.first(:id => params[:post])
    erb :show
end
