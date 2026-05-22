class ExpensesController < ApplicationController
  def index
    @expenses = Expense.includes(:employee).order(spent_on: :desc)
  end

  def show
    @expense = Expense.find(params[:id])
  end
end
