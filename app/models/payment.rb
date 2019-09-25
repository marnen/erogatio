class Payment < ApplicationRecord
  belongs_to :work_unit

  validates_presence_of :amount, :date, :work_unit_id
end
