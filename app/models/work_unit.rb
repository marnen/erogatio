class WorkUnit < ApplicationRecord
  belongs_to :user

  validates_presence_of :date, :hours, :user_id
end
