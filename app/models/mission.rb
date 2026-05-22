class Mission < ApplicationRecord
  belongs_to :client
  belongs_to :consultant, class_name: "User"
  has_many :invoices, dependent: :destroy

  validates :title, presence: true
end
