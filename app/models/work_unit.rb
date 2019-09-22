class WorkUnit < ApplicationRecord
  belongs_to :user

  validates_presence_of :date, :hours, :user_id

  def self.permitted_params
    content_columns.map(&:name).reject {|name| name.ends_with? '_at' }
  end
end
