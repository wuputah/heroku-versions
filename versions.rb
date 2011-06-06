require 'sinatra'
require 'cgi'
require 'erb'

enable :run

before do
  @stack = ENV['STACK'] || 'cedar'
end

get '/' do
  headers 'Cache-Control' => 'public, max-age=3600'
  ENV['DATABASE_URL'] = ENV['DATABASE_URL'].sub(/:(?!\/\/)[^@]*/, ':xxxxxxxxxxxxxxxxx') if ENV['DATABASE_URL']
  ENV['SHARED_DATABASE_URL'] = ENV['SHARED_DATABASE_URL'].sub(/:(?!\/\/)[^@]*/, ':xxxxxxxxxxxxxxxxx') if ENV['SHARED_DATABASE_URL']
  ENV['LAST_GIT_BY'] = 'your@email.address' if ENV['LAST_GIT_BY']
  erb :index
end

get '/evil' do
  headers 'Cache-Control' => 'public, max-age=60'
  erb :evil
end
