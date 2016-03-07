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

require 'rails_helper'

RSpec.describe Charge, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
