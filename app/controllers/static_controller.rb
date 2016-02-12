class StaticController < ApplicationController
  def index
    @tutorials = Tutorial.limit(10).order("RANDOM()")
  end
end
