class WorkUnit < ApplicationRecord
  belongs_to :user
  has_many :payments

  validates_presence_of :date, :hours, :user_id

  def self.permitted_params
    content_columns.map(&:name).reject {|name| name.ends_with? '_at' }
  end

  def paid?
    !payments.empty? # TODO: adequate for right now, but will need work
  end
end
