class User < ApplicationRecord
  has_one :wallet
  has_many :cards, through: :wallet

  authenticates_with_sorcery!
  has_one :license
  enum role: { client: 0, supervisor: 1, admin: 2 }

  validates :first_name, :last_name, :email, :dni, presence: true
  validates :email, :dni, uniqueness: true
  validates :dni, numericality: { only_integer: true }
  validates :email, email: true
  validates :password, length: { minimum: 3 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }
  validates :role, presence: true, inclusion: { in: roles.keys }
  validates_format_of :first_name, :last_name, with: NAMES_FORMAT

  def name
    "#{first_name} #{last_name.capitalize}"
  end
end
