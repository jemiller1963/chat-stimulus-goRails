# == Schema Information
#
# Table name: channel_users
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  channel_id :bigint           not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_channel_users_on_channel_id  (channel_id)
#  index_channel_users_on_user_id     (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (channel_id => channels.id)
#  fk_rails_...  (user_id => users.id)
#

require 'rails_helper'

RSpec.describe ChannelUser, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
