# == Schema Information
#
# Table name: notifications
#
#  id              :integer          not null, primary key
#  recipient_id    :integer
#  actor_id        :integer
#  read_at         :datetime
#  action          :string
#  notifiable_id   :integer
#  notifiable_type :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

FactoryGirl.define do
  factory :notification do
    recipient_id 1
    actor_id 1
    read_at "2016-03-30 03:07:09"
    action "MyString"
    notifiable_id 1
    notifiable_type "MyString"
  end
end
