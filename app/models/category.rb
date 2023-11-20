class Category < ApplicationRecord
  belongs_to :user

  has_many :transaction_entities, dependent: :destroy
  has_many :transactions, through: :transaction_entities, dependent: :destroy

  validates :name, presence: true
  validates :icon, presence: true
end
