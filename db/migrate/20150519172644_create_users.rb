class CreateUsers < ActiveRecord::Migration
  def change
    create_table(:users) do |t|
      t.column(:name, :string)
      t.column(:email, :string)
      t.column(:programmer_rating, :integer)
      t.column(:description, :string)

      t.timestamps()
    end
  end
end
