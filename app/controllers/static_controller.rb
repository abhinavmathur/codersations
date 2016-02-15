class StaticController < ApplicationController
  def index
    @tutorials = policy_scope(Tutorial.limit(10).order("RANDOM()"))
  end
end
