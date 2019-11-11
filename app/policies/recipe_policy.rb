class RecipePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def index?
    return true
  end

  def new?
    return true
  end

  def show?
    return true
  end

  def edit?
    (record.user_id == user.id || user.admin)
  end

  def update?
    (record.user_id == user.id || user.admin)
  end

  def create?
    (record.user_id == user.id || user.admin)
  end


  def home?
    return true
  end

  def category?
    return true
  end
end
