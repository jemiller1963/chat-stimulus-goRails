class AddDescToChannels < ActiveRecord::Migration[6.0]
  def change
add_column :channels, :desc, :text
  end
end
