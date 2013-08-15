class Admin::BillingsController < ApplicationController
  layout 'admin'
  def index
    @billings = Billing.all
  end

  def show
  end

  def edit
  end
end
