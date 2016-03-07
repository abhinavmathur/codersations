class SnippetPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      return scope.all if user.try(:admin) || user.try(:manager)
      scope.where(publish: true)
    end
  end

  def create?
    user.try(:admin) || user.try(:creator)
  end

  def show?
    record.publish || record.author == user || user.try(:admin) || user.try(:manager)
  end

  def update?
    record.author == user || user.try(:admin)
  end

  def destroy?
    record.author == user || user.try(:admin)
  end
end
