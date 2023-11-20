class Transaction < ApplicationRecord
  belongs_to :author
  has_many :transaction_entities, dependent: :destroy
  has_many :categories, through: :transaction_entities, dependent: :destroy

  validates :name, presence: true
  validates :amount, presence: true
end
