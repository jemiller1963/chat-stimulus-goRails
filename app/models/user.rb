# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  admin                  :boolean          default(FALSE)
#  approved               :boolean          default(FALSE)
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  fname                  :string
#  lname                  :string
#  memos                  :string
#  name                   :string           default(""), not null
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  username               :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_approved              (approved)
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#

class User < ApplicationRecord
  after_create :send_admin_email

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :channel_users, dependent: :destroy
  has_many :channels, through: :channel_users
  has_many :messages, dependent: :destroy

  has_many :notes, dependent: :destroy

  scope :admins, -> { where(admin: true) }
  scope :nonadmins, -> { where(admin: false) }

  def active_for_authentication?
    super && approved?
  end

  def inactive_message
    approved? ? super : :not_approved
  end

  def send_admin_email
    AdminMailer.new_user_waiting_for_approval(email).deliver_now
  end

end
