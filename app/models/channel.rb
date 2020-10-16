# == Schema Information
#
# Table name: channels
#
#  id         :bigint           not null, primary key
#  desc       :text
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Channel < ApplicationRecord
  has_many :channel_users, dependent: :destroy
  has_many :users, through: :channel_users
  has_many :messages, dependent: :destroy

  validates :name, presence: true
  validates :name, uniqueness: true
  validates :desc, presence: true
  validates :desc, length: { in: 6..50 }
end
