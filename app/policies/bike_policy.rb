class BikePolicy < ApplicationPolicy
  def create?
    true if user
  end

  def index?
    true
  end

  def show?
    true
  end

  def edit?

  end

  def new?
    true if user
  end

  def destroy?
    true if user && record.user == user
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
