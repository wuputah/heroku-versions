require 'sinatra'
require 'cgi'
require 'erb'

enable :run

get '/' do
  headers 'Cache-Control' => 'public, max-age=3600'
  ENV['DATABASE_URL'] = ENV['DATABASE_URL'].sub(/:(?!\/\/)[^@]*/, ':xxxxxxxxxxxxxxxxx')
  ENV['LAST_GIT_BY'] = 'your@email.address'
  erb :index
end

get '/evil' do
  headers 'Cache-Control' => 'public, max-age=60'
  erb :evil
end
