class Client < ApplicationRecord
  has_many :missions, dependent: :nullify

  validates :name, presence: true
end
