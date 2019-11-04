class Client < ApplicationRecord
  include PermitContentColumns

  belongs_to :user
  has_many :work_units
  validates_presence_of :name, :user_id
end
