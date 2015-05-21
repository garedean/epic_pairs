require('bundler/setup')
Bundler.require(:default, :production, :test)
require('digest/md5')
Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

helpers do
  def select_if_skill(object, expected)
    if object.programmer_rating && object.programmer_rating == expected
      "selected"
    end
  end

  def select_if_match(object, expected)
    if object.preferred_matches
      preferred_matches = object.preferred_matches.split("").map(&:to_i)
      if preferred_matches.include?(expected)
        preferred_matches = object.preferred_matches.split("").map(&:to_i)
      "selected"
      end
    end
  end

  def gravatar_link(user)
    user_hash = user.email_hashed
    "<img src='http://www.gravatar.com/avatar/#{user_hash}?s=200'>"
  end

  def matches_link
    unless request.fullpath == "/" || request.fullpath == "/signup"
        erb "<li><a href='/users/<%= @user.id %>/matches'>My Matches</a></li>"
    end
  end

  def display?
    if request.fullpath == "/" || request.fullpath == "/signup"
        erb "none"
    end
  end
end

get('/') do
  #erb(:"user/login", layout: :landing_page)
  erb(:"user/login")
end

get('/reset') do
  User.delete_all
  redirect to("/")
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
  #erb(:"user/signup", layout: :landing_page)
  erb(:"user/signup")
end

get('/users') do
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
  @object = User.find(params["id"].to_i)
  preferred_matches = params["preferred_matches"].join
  hometown          = params["hometown"]
  portland_duration = params["portland_duration"]
  hobbies           = params["hobbies"]
  pair_qualities    = params["pair_qualities"]
  email             = params["email"]
  @object.update(email: email, programmer_rating: rating_update, hometown: hometown, portland_duration: portland_duration, hobbies: hobbies, pair_qualities: pair_qualities, preferred_matches: preferred_matches)

  if @object.save
    redirect to("/users/#{@object.id}")
  else
    erb(:errors)
  end
end

get('/users/:id/matches') do
  @user = User.find(params[:id].to_i)
  @users = User.all()

  erb(:"user/matches")
end

get('/users/:id/profile') do
  @user = User.find(params.fetch("id").to_i)
  erb(:"user/profile")
end

get('/users/:user_id/matches/:id') do
  @user  = User.find(params[:user_id].to_i)
  @users = User.all()
  @match = User.find(params[:id].to_i)

  erb(:"user/matches")
end
