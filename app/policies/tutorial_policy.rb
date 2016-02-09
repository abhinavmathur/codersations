class TutorialPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      return scope.all if user.admin
    end
  end

  def show?
    record.contributors.exists?(member_id: user.id, tutorial_id: record.id, access: true) || user.try(:admin) || record.author == user
  end
end
