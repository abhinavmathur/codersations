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
#  sign_in_count          :integer          default("0"), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :inet
#  last_sign_in_ip        :inet
#  confirmation_token     :string
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#  unconfirmed_email      :string
#  failed_attempts        :integer          default("0"), not null
#  unlock_token           :string
#  locked_at              :datetime
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  admin                  :boolean          default("false")
#  creator                :boolean          default("false")
#  manager                :boolean          default("false")
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
#  linkedin               :string
#

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  acts_as_marker
  markable_as :follow, :by => :user
  searchkick text_start: [:name]

  after_save :update_stripe_account_email

  validates :name, presence: true
  has_many :templates, dependent: :nullify
  has_many :tutorials, dependent: :nullify
  has_many :charges, dependent: :destroy
  has_many :snippets, dependent: :nullify
  has_many :purchases, dependent: :destroy
  has_many :notes, dependent: :destroy

  has_many :members, foreign_key: :member_id
  has_many :tutorials, through: :contributors

  def subscribed?
    stripe_subscription_id?
  end

  def update_stripe_email(user)
    if user.stripe_id?
      customer = Stripe::Customer.retrieve(user.stripe_id)
      customer.email = user.email
      customer.save
    end
  end

  def update_stripe_account_email
    if self.stripe_id?
      customer = Stripe::Customer.retrieve(self.stripe_id)
      customer.email = self.email
      customer.save
    end
  end

  def first_name
    name = self.name.split(" ")
    name[0].to_s
  end

  def last_name
    name = self.name.split(" ")
    if name.count == 1
      name = ''
    else
      name = name[name.length - 1].to_s
    end
    name
  end
end
