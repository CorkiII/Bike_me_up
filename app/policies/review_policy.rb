class ReviewPolicy < ApplicationPolicy
  def new?
    true if user
  end

  def create?
    true if user
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
