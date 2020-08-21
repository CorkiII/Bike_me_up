class ReviewPolicy < ApplicationPolicy
  def create?

    # user.bookings.where(bike_id: record.bike_id).first.present?
    true if user.bookings.where(bike_id: record.bike_id)

  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
