class UserPolicy < ApplicationPolicy
  def show?
    user.present?
  end

  def edit?
    record.id == user.id || user.admin?
  end

  def update?
    edit?
  end
end
