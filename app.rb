require('sinatra')
require('sinatra/activerecord')
require('sinatra/reloader')
also_reload('lib/*.rb')
require('./lib/users')
require('pg')
require('pry')


get('/') do
  erb(:index)
end

get('/user_list') do
  @users = User.all()
  erb(:?)
end

get('/user_detail/:id') do
  @user = User.find(params.fetch("id").to_i)
  erb(:?)
end

post('/add_user') do
  fname = params.fetch("fname")
  lname = params.fetch("lname")
  description = params.fetch("description")
  email = params.fetch("email")
  prog_rating = params.fetch("rating")
  User.new({fname: fname, lname: lname, description: description, email: email, rating: prog_rating})
  erb(:?)
end

patch('/user_detail/:id') do
  description_update = params.fetch("description")
  rating_update = params.fetch("rating")
  @user = User.find(params.fetch("id").to_i)
  @user.update({description: description_update, rating: rating_update})
  erb(:?)
end

delete('/user_detail/:id') do
  @user = User.find(params.fetch("id").to_i).delete
  @users = User.all()
  erb(:?)
end
