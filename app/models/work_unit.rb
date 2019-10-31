class WorkUnit < ApplicationRecord
  include PermitContentColumns

  belongs_to :user
  has_many :payments

  validates_presence_of :date, :hours, :user_id

  def self.permitted_params
    super + ['decimal_hours']
  end

  def decimal_hours
    hours.to_f / 1.hour
  end

  def decimal_hours=(number)
    self.hours = number.hours
  end

  def paid?
    !payments.empty? # TODO: adequate for right now, but will need work
  end
end
