class VendorsController < ApplicationController
  def index
    @vendors = Vendor.order(:name)
  end

  def show
    @vendor = Vendor.find(params[:id])
  end
end
