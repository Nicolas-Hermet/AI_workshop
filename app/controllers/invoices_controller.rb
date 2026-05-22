class InvoicesController < ApplicationController
  def index
    @invoices = policy_scope(Invoice).includes(mission: :client)
  end

  def show
    @invoice = Invoice.find(params[:id])
    authorize @invoice
  end
end
