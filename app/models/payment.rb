class Payment < ApplicationRecord
  belongs_to :work_unit

  validates_presence_of :amount, :date, :work_unit_id

  def self.permitted_params
    content_columns.map(&:name).reject {|name| name.ends_with? '_at' }
  end
end
