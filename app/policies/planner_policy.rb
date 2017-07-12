class PlannerPolicy < ApplicationPolicy

  def show?
    record.try(:user) == user
  end

  def new?
    record.try(:user) == user
  end

  def create?
    record.try(:user) == user
  end

  def edit?
    record.try(:user) == user
  end

  def update?
    record.try(:user) == user
  end

  def destroy?
    record.try(:user) == user
  end
end