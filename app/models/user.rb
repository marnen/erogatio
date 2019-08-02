class User < ApplicationRecord
  authenticates_with_sorcery!

  has_many :work_units

  validates :email, presence: true, uniqueness: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password, length: {minimum: 3}, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates_presence_of :password_confirmation, if: -> { new_record? || changes[:crypted_password] }
end
