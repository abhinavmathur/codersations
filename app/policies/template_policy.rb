class TemplatePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      return scope.all if user.admin || user.manager
      return scope.where(publish: true)
    end
  end

  def create?
    user.try(:admin) || user.try(:creator)
  end

  def show?
    record.publish
  end

  def update?
    user.try(:admin) || record.author == user || user.try(:manager)
  end

  def destroy?
    user.try(:admin) || record.author == user
  end
end
