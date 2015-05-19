class AddRatingsToUsers < ActiveRecord::Migration
  def change
    add_column(:users, :pace_rating, :integer)
    add_column(:users, :project_rating, :integer)
    add_column(:users, :lb_rating, :integer)
  end
end
