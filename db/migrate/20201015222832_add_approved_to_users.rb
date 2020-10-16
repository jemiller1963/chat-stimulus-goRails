class AddApprovedToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :approved, :boolean, default: false
    add_column :users, :notes, :string
  end
end
