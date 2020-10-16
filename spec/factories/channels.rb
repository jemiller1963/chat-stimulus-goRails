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

FactoryBot.define do
  factory :channel do
    name { "MyString" }
  end
end
