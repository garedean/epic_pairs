class User < ActiveRecord::Base
validates(:first_name, :presence => true)
validates(:last_name, :presence => true)
validates(:email, :presence => true)
before_validation(:titleize_first_name)
before_validation(:titleize_last_name)

def email_hashed
  Digest::MD5.hexdigest(email)
end

# How comfortable are you as a programmer?
  define_method(:prog_match) do |second_user|
    total_points = 0
    if self.programmer_rating==(second_user.programmer_rating)
      total_points = 5
    elsif self.programmer_rating==(second_user.programmer_rating + 1) || self.programmer_rating==(second_user.programmer_rating - 1)
      total_points = 3
    elsif self.programmer_rating==(second_user.programmer_rating + 2) || self.programmer_rating==(second_user.programmer_rating - 2)
      total_points = 1
    else
      total_points = 0
    end
    total_points
  end

# How comfortable are you with your current project?
  define_method(:project_match) do |second_user|
    total_points = 0
    if self.project_rating==(second_user.project_rating)
      total_points = 5
    elsif self.project_rating==(second_user.project_rating + 1) || self.project_rating==(second_user.project_rating - 1)
      total_points = 3
    elsif self.project_rating==(second_user.project_rating + 2) || self.project_rating==(second_user.project_rating - 2)
      total_points = 1
    else
      total_points = 0
    end
    total_points
  end

# What is your preferred pace?
  define_method(:pace_match) do |second_user|
    total_points = 0
    if self.pace_rating==(second_user.pace_rating)
      total_points = 5
    elsif self.pace_rating==(second_user.pace_rating + 1) || self.pace_rating==(second_user.pace_rating - 1)
      total_points = 3
    elsif self.pace_rating==(second_user.pace_rating + 2) || self.pace_rating==(second_user.pace_rating - 2)
      total_points = 1
    else
      total_points = 0
    end
    total_points
  end

# Are you in the mood to learn or build?
  define_method(:lb_match) do |second_user|
    total_points = 0
    if self.lb_rating==(second_user.lb_rating)
      total_points = 5
    elsif self.lb_rating==(second_user.lb_rating + 1) || self.lb_rating==(second_user.lb_rating - 1)
      total_points = 3
    elsif self.lb_rating==(second_user.lb_rating + 2) || self.lb_rating==(second_user.lb_rating - 2)
      total_points = 1
    else
      total_points = 0
    end
    total_points
  end

# What is your preferred match?
  define_method(:preferred_match) do |second_user|
    total_points = 0
    integer_matches = self.preferred_matches.split("").map(&:to_i)
    if integer_matches.include?(second_user.programmer_rating)
      total_points = 3
    else
      total_points = 0
    end
    total_points
  end

# This will find your best matches.
  define_method(:match) do |second_user|
    total_points = 0
    total_points = self.prog_match(second_user)
    total_points = total_points + self.project_match(second_user)
    total_points = total_points + self.pace_match(second_user)
    total_points = total_points + self.lb_match(second_user)
    total_points = total_points + self.preferred_match(second_user)
    if total_points >= 15
      "great match"
    else
      "not a good match"
    end
  end

  define_singleton_method(:randomize_user_pref) do
    options = [1, 2, 3, 4, 5]
    output_pref = []
    choice_amount = Random.new.rand(1..5)
    choice_amount.times() do
      pref_id = Random.new.rand(1..5)
      output_pref << pref_id
    end
    output_pref.uniq.join
  end

  define_method(:print_all_matches) do
    matches = []
    User.all.each() do |user|
      if self.match(user) == ("great match")
        matches << user
      end
    end

    matches
  end

  private

  define_method(:titleize_first_name) do
    self.first_name = (first_name().titleize())
  end

  define_method(:titleize_last_name) do
    self.last_name = (last_name().titleize())
  end
end
