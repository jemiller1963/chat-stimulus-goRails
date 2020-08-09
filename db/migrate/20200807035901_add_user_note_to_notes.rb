class AddUserNoteToNotes < ActiveRecord::Migration[6.0]
  def change
    add_column :notes, :user_note, :string
  end
end
