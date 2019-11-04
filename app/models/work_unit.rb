class WorkUnit < ApplicationRecord
  include PermitContentColumns

  belongs_to :client
  has_one :user, through: :client
  has_many :payments

  validates_presence_of :client_id, :date, :hours

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
