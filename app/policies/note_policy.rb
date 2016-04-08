class NotePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def create?
    user.subscribed? || user.purchases.exists?(tutorial_id: record.tutorial.id) || user.try(:admin) || user.try(:manager) || user == record.tutorial.author
  end

  def update?
    record.user_id == user.id
  end

  def show?
    record.user_id == user.id
  end

  def destroy?
    record.user_id == user.id
  end
end
