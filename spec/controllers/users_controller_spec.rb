# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  name                   :string           default(""), not null
#  description            :text
#  github                 :string
#  bitbucket              :string
#  personal_website       :string
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :inet
#  last_sign_in_ip        :inet
#  confirmation_token     :string
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#  unconfirmed_email      :string
#  failed_attempts        :integer          default(0), not null
#  unlock_token           :string
#  locked_at              :datetime
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  admin                  :boolean          default(FALSE)
#  creator                :boolean          default(FALSE)
#  manager                :boolean          default(FALSE)
#  stripe_id              :string
#  stripe_subscription_id :string
#  card_last4             :string
#  card_exp_month         :integer
#  card_exp_year          :integer
#  card_type              :string
#  stripe_account_id      :string
#  publishable_key        :string
#  secret_key             :string
#  currency               :string
#

require 'rails_helper'

RSpec.describe UsersController, type: :controller do

end
