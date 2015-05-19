class User <ActiveRecord::Base

validates(:name, :presence => true)

validates(:email, :presence => true)

validates(:description, :presence => true)

validates(:programmer_rating, :presence => true)

end
