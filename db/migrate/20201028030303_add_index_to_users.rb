class AddIndexToUsers < ActiveRecord::Migration[6.0]
  def change
    add_index :users, :approved
  end
end
