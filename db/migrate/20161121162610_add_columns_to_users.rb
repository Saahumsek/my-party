class AddColumnsToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :username, :string
    add_column :users, :age, :integer
    add_column :users, :gender, :string
  end
end
