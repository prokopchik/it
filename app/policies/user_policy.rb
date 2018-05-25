class UserPolicy < ApplicationPolicy
  def edit?
    user.present? && (record == user || user.admin?)
  end

  def update?
    user.present? && (record == user || user.admin?)
  end
end
