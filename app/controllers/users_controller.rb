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

class UsersController < ApplicationController

  before_action :set_user, only: [:show, :follow, :unfollow]
  before_action :authenticate_user!, only: [:follow, :unfollow]

  def show
    @templates = policy_scope Template.includes(:category).where(author_id: @user.id).all
    @tutorials = policy_scope Tutorial.includes(:category).where(author: @user).all
    @snippets = policy_scope Snippet.includes(:category).where(author: @user).all
  end

  def follow
    current_user.follow_users << @user
    redirect_to user_path(@user)
  end

  def unfollow
    current_user.follow_users.delete @user
    redirect_to user_path(@user)
  end

  private
  def set_user
    begin
      @user = User.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      flash[:danger] = 'The user you were looking for could not be found'
      redirect_to root_path
    end
  end
end
