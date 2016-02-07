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

class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @templates = Template.where(author_id: @user.id).all
    @tutorials = Tutorial.where(author: @user).all

  end
end
