# == Schema Information
#
# Table name: users
#
#  id                       :integer          not null, primary key
#  email                    :string           default(""), not null
#  encrypted_password       :string           default(""), not null
#  name                     :string           default(""), not null
#  description              :text
#  github                   :string
#  display_github           :boolean          default(FALSE)
#  bitbucket                :string
#  display_bitbucket        :boolean          default(FALSE)
#  personal_website         :string
#  display_personal_website :boolean
#  reset_password_token     :string
#  reset_password_sent_at   :datetime
#  remember_created_at      :datetime
#  sign_in_count            :integer          default(0), not null
#  current_sign_in_at       :datetime
#  last_sign_in_at          :datetime
#  current_sign_in_ip       :inet
#  last_sign_in_ip          :inet
#  confirmation_token       :string
#  confirmed_at             :datetime
#  confirmation_sent_at     :datetime
#  unconfirmed_email        :string
#  failed_attempts          :integer          default(0), not null
#  unlock_token             :string
#  locked_at                :datetime
#  created_at               :datetime         not null
#  updated_at               :datetime         not null
#  admin                    :boolean          default(FALSE)
#

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  acts_as_marker
  markable_as :follow, :by => :user
  validates :name, presence: true
  has_many :templates
  has_many :tutorials
  has_one :blog

  has_many :members, foreign_key: :member_id
  has_many :tutorials, through: :contributors


  def display_bitbucket?
    display_bitbucket
  end

  def display_github?
    display_github
  end

  def display_personal_website?
    display_personal_website
  end
end
