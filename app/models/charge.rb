# == Schema Information
#
# Table name: charges
#
#  id             :integer          not null, primary key
#  user_id        :integer
#  stripe_id      :string
#  amount         :integer
#  card_last4     :string
#  card_type      :string
#  card_exp_month :string
#  card_exp_year  :string
#  data_type      :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class Charge < ActiveRecord::Base
  belongs_to :user
end
