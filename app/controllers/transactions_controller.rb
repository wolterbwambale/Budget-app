class TransactionsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_category, except: [:index]
  def index
    @category = Category.find(params[:category_id])
    @transactions = @category.transactions.order(created_at: :desc)
    @total_amount = @transactions.sum(:amount)
  end

  def show
    @transaction = Transaction.find(params[:id])
    @category = @transaction.category
  end

  def new
    @category = Category.find(params[:category_id])
    @transaction = @category.transactions.build
  end

  def create
    @transaction = @category.transactions.build(transaction_params)
    if @transaction.save
      redirect_to category_transactions_path(@category), notice: 'Transaction created successfully!'
    else
      render :new
    end
  end

  private

  def set_category
    @category = current_user.categories.find(params[:category_id])
  end

  def transaction_params
    params.require(:transaction).permit(:name, :amount)
  end
end
