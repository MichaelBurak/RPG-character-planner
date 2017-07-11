class CharacterPolicy < ApplicationPolicy

  def attribute_selection?
    record.try(:user) == user
  end

  def destroy?
    record.try(:user) == user
  end

  def experience?
    record.try(:user) == user
  end

  def level_up?
    record.try(:user) == user
  end

  def update?
    record.try(:user) == user
  end
end

