class Note < ApplicationRecord
  belongs_to :user

  # scope :that_are_active, -> {where('active = ?', true).order('created_at DESC')}
  # scope :that_are_mine, -> {where('user_id = current_user.id').order('created_at DESC')}

  include ImageUploader::Attachment(:image)

  validates :title, presence: true
end
