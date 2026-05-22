class InvoicePolicy < ApplicationPolicy
  def index?
    user.present?
  end

  def show?
    user.admin? || record.mission.consultant_id == user.id
  end

  class Scope < Scope
    def resolve
      if user.admin?
        scope.all
      else
        scope.joins(:mission).where(missions: { consultant_id: user.id })
      end
    end
  end
end
