class AddingDescriptiveColumns < ActiveRecord::Migration
  def change
    add_column(:users, :hometown, :varchar)
    add_column(:users, :portland_duration, :varchar)
    add_column(:users, :hobbies, :text)
    add_column(:users, :pair_qualities, :text)
    add_column(:users, :preferred_matches, :varchar)
  end
end
