class PaymentsController < ApplicationController
  def new
    load_work_unit!
    @payment = Payment.new date: Date.today, amount: @work_unit.pay
  end

  def create
    load_work_unit!
    @work_unit.payments.create! params.require(:payment).permit :date, :amount
    redirect_to work_units_path
  end

  private

  def load_work_unit!
    @work_unit = WorkUnit.find params[:work_unit_id]
  end
end
