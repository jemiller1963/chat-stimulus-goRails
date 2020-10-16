# == Schema Information
#
# Table name: notes
#
#  id         :bigint           not null, primary key
#  active     :boolean          default(TRUE), not null
#  body       :text
#  image_data :text
#  title      :string
#  user_note  :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_notes_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#

class Note < ApplicationRecord
  belongs_to :user

  # scope :that_are_active, -> {where('active = ?', true).order('created_at DESC')}
  # scope :that_are_mine, -> {where('user_id = current_user.id').order('created_at DESC')}

  include ImageUploader::Attachment(:image)

  validates :title, presence: true
end
