ENV['RACK_ENV'] = 'test'

require('sinatra/activerecord')
require('capybara/rspec')
require('rspec')
require('rake')
require('user')
require('pry')
require('pg')
require('shoulda-matchers')
require('launchy')

RSpec.configure do |config|
  config.after(:each) do
    User.all.each do |user|
      user.destroy
    end
  end
end
