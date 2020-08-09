class AddLastNameToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :lname, :string
    rename_column :users, :name, :fname
  end
end
