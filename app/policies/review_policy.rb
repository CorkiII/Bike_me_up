class ReviewPolicy < ApplicationPolicy
  def create?
    user.bookings.where(bike_id: record.bike_id).first.present?
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
