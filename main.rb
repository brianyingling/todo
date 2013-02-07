require 'pry'
require 'sinatra'
require 'sinatra/reloader' if development?
require 'active_support/all'
require 'JSON'
require 'httparty'
require 'pg'


# shows the todo lists
get '/' do
  sql = "select * from notes"
  conn = PG.connect(:dbname=>'todo',:host=>'localhost')
  @rows = conn.exec(sql)
  erb :notes
end

# creates the todo list
get '/new' do
  erb :new
end

# posts the info to the server
post '/create' do
  # connect to the db
  conn = PG.connect(:dbname=>'todo',:host=>'localhost')

  # instantiate input variables
  @title = params['title']
  @description = params['description'].gsub("'","\'")

  # create sql
  sql = "insert into notes (title, description) values ('#{@title}','#{@description}')"

  # insert sql into db
  conn.exec(sql)
  #binding.pry
  conn.close

  # redirect to main page
  redirect to "/"
end

post '/modify' do
  @id = params['id']
  sql = "delete from notes where id=#{@id}"
  conn = PG.connect(:dbname=>'todo',:host=>'localhost')
  conn.exec(sql)
  conn.close
  redirect to "/"
end

# redirects back to todo list pg.
get '/create' do
end