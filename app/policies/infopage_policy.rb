class InfopagePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      return scope.all if user.try(:admin) || user.try(:manager)
      scope.joins(:templates).where(templates: {publish: true})
    end
  end

  def create?
    user.try(:admin) || @record.template.author == user
  end

  def show?
    user.try(:admin) || @record.template.publish || @record.template.author == user || user.try(:manager)
  end

  def update?
    user.try(:admin) || @record.template.publish || @record.template.author == user || user.try(:manager)
  end

  def destroy?
    user.try(:admin) || @record.template.author == user
  end
end
