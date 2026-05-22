class Employee < ApplicationRecord
  belongs_to :department, optional: true
  has_many :timesheets, dependent: :nullify
  has_many :expenses, dependent: :nullify

  validates :first_name, :last_name, presence: true

  def full_name
    "#{first_name} #{last_name}"
  end
end
