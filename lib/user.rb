class User <ActiveRecord::Base

validates(:first_name, :presence => true)

validates(:last_name, :presence => true)

validates(:email, :presence => true)

validates(:description, :presence => true)
validates :description, length: { maximum: 500 }

validates(:programmer_rating, :presence => true)

before_validation(:titleize_first_name)
before_validation(:titleize_last_name)

  define_method(:match) do |second_user|
    if self.programmer_rating==(second_user.programmer_rating)
      "great"
    elsif self.programmer_rating==(second_user.programmer_rating + 1) || self.programmer_rating==(second_user.programmer_rating - 1)
      "good"
    elsif self.programmer_rating==(second_user.programmer_rating + 2) || self.programmer_rating==(second_user.programmer_rating - 2)
      "okay"
    else
      "bad"
    end
  end

  private

  define_method(:titleize_first_name) do
    self.first_name = (first_name().titleize())
  end

  define_method(:titleize_last_name) do
    self.last_name = (last_name().titleize())
  end
end
