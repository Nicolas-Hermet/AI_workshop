class MissionPolicy < ApplicationPolicy
  def index?
    user.present?
  end

  def show?
    user.admin? || record.consultant_id == user.id
  end

  def create?
    user.present?
  end

  def update?
    show?
  end

  def destroy?
    user.admin?
  end

  class Scope < Scope
    def resolve
      if user.admin?
        scope.all
      else
        scope.where(consultant_id: user.id)
      end
    end
  end
end
