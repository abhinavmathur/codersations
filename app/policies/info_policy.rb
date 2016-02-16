class InfoPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
     return scope.all if user.try(:admin) || user.try(:manager)
      scope.tutorial.where(publish: true)
    end
  end

  def create?
    record.tutorial.contributors.exists?(member: user, tutorial: record.tutorial, access: true) || user.try(:admin) || record.tutorial.author == user
  end

  def show?
    record.tutorial.publish || user.try(:admin) || record.author == user || user.try(:manager) || record.tutorial.contributors.exists?(member: user, tutorial: record.tutorial, access: true)
  end

  def update?
    user.try(:admin) || @record.tutorial.author == user || user.try(:manager) || record.tutorial.contributors.exists?(member: user, tutorial: record.tutorial, access: true)
  end

  def destroy?
    user.try(:admin) || @record.tutorial.author == user
  end
end
