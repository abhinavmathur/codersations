class TutorialPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      return scope.none if user.nil?
      return scope.all if user.admin
    end
  end

  def create?
    user.try(:admin) || user.try(:creator)
  end

  def update?
    #record.contributors.exists?(member_id: user.id, tutorial_id: record.id, access: true) || user.try(:admin) || record.author == user
    user.try(:admin) || record.author == user || user.try(:manager)
  end

  def destroy?
    user.try(:admin) || record.author == user
  end
end
