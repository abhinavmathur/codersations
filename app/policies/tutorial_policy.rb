class TutorialPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      return scope.all if user.try(:admin) || user.try(:manager)
      return scope.where(publish: true)
    end
  end

  def create?
    user.try(:admin) || user.try(:creator)
  end

  def show?
    record.publish || record.contributors.exists?(member_id: user.id, tutorial_id: record.id, access: true) || user.try(:admin) || record.author == user || user.try(:manager)
  end

  def update?
    record.contributors.exists?(member_id: user.id, tutorial_id: record.id, access: true) || user.try(:admin) || record.author == user || user.try(:manager)
  end

  def destroy?
    user.try(:admin) || record.author == user
  end

  def add_member?
    user.try(:admin) || record.author == user
  end


end
