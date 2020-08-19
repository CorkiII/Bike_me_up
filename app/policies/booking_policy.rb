class BookingPolicy < ApplicationPolicy
  def create?
    true
  end

  def show?
    true if user && record.user == user
  end

  class Scope < Scope
    def resolve
      scope.where(user: user)
    end
  end


end
