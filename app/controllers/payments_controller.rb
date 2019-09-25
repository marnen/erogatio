class PaymentsController < ApplicationController
  before_action :load_work_unit!

  def new
    @payment = Payment.new date: Date.today, amount: @work_unit.pay
  end

  def create
    @work_unit.payments.create! params.require(:payment).permit :date, :amount
    redirect_to work_units_path
  end

  private

  def load_work_unit!
    @work_unit = WorkUnit.find params[:work_unit_id]
  end
end
