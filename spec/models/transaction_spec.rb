require 'rails_helper'

RSpec.describe Transaction, type: :model do
  before :each do
    @transaction = Transaction.new(name: 'Clothes', amount: 50)
  end

  it 'name should be present' do
    expect(@transaction.name).to eq('Clothes')
  end

  it 'amount should be present' do
    expect(@transaction.amount).to eq(50)
  end
end
