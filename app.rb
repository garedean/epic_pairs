require('bundler/setup')
Bundler.require(:default, :production, :test)
Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get('/') do
  erb(:index)
end

get('/reset') do
  User.delete_all
  redirect back
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
  email = params.fetch("email")
  @object = User.new(first_name: fname, last_name: lname, email: email)

  if @object.save
    redirect to(:"users/#{@object.id}")
  else
    erb(:errors)
  end
end

patch('/users/:id') do
  rating_update = params.fetch("rating")
  @object = User.find(params.fetch("id").to_i)
  preferred_matches = params.fetch("preferred_matches").join
  hometown = params.fetch("hometown")
  portland_duration = params.fetch("portland_duration")
  hobbies = params.fetch("hobbies")
  pair_qualities = params.fetch("pair_qualities")
  @object.update({programmer_rating: rating_update, hometown: hometown, portland_duration: portland_duration, hobbies: hobbies, pair_qualities: pair_qualities, preferred_matches: preferred_matches})
  if @object.save
    redirect to("/users/#{@object.id}")
  else
    erb(:errors)
  end
end

# delete('/users/:id') do
#   @user = User.find(params.fetch("id").to_i).delete
#   @users = User.all()
#   redirect to(:"user/users")
# end
