class InfopagePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      return scope.all if user.try(:admin) || user.try(:manager)
      return scope.template.where(publish: true)
    end
  end

  def create?
    user.try(:admin) || record.template.author == user
  end

  def show?
    user.try(:admin) || record.template.publish || record.template.author == user || user.try(:manager)
  end

  def update?
    user.try(:admin) || record.template.publish || record.template.author == user || user.try(:manager)
  end

  def destroy?
    user.try(:admin) || record.template.author
  end
end
