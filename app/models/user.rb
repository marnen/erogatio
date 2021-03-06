class User < ApplicationRecord
  authenticates_with_sorcery!

  has_many :clients
  has_many :work_units, through: :clients

  validates :email, presence: true, uniqueness: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password, length: {minimum: 3}, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates_presence_of :password_confirmation, if: -> { new_record? || changes[:crypted_password] }

  def self.permitted_params
    %i[email password password_confirmation]
  end
end
