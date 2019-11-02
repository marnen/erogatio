class Client < ApplicationRecord
  belongs_to :user
  has_many :work_units
  validates_presence_of :name, :user_id
end
