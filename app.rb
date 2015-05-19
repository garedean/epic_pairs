require('sinatra')
require('sinatra/activerecord')
require('sinatra/reloader')
also_reload('lib/*.rb')
require('./lib/user')
require('pg')
require('pry')

get('/') do
  erb(:index)
end

get('/login') do
  erb(:"user/login", layout: :landing_page)
end

post('/authenticate') do |email, password|
  user = User.find_by(email: email)

  if user
    redirect to("/users/#{user.id}")
  else
    redirect back
  end
end

get('/signup') do
  erb(:"user/signup", layout: :landing_page)
end

get('/users') do
  @users = User.all()
  erb(:"user/users")
end

get('/users/:id') do
  @user = User.find(params.fetch("id").to_i)
  erb(:"user/user")
end

post('/users') do
  fname = params.fetch("fname")
  lname = params.fetch("lname")
  description = params.fetch("description")
  email = params.fetch("email")
  prog_rating = params.fetch("rating")
  User.new({fname: fname, lname: lname, description: description, email: email, rating: prog_rating})
  erb(:"user/signup")
end

patch('/users/:id') do
  description_update = params.fetch("description")
  rating_update = params.fetch("rating")
  @user = User.find(params.fetch("id").to_i)
  @user.update({description: description_update, rating: rating_update})
  redirect to(:"user/user")
end

# delete('/users/:id') do
#   @user = User.find(params.fetch("id").to_i).delete
#   @users = User.all()
#   redirect to(:"user/users")
# end
