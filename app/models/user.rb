class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :missions, foreign_key: :consultant_id, dependent: :nullify
  has_many :documents, dependent: :nullify
  has_many :notifications, dependent: :nullify
  has_many :audit_events, dependent: :nullify

  ROLES = %w[consultant admin].freeze
  validates :role, inclusion: { in: ROLES }

  def admin?
    role == "admin"
  end
end
