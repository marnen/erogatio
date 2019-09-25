class PaymentsController < ApplicationController
  before_action :require_login, :load_work_unit!, :authorize_work_unit!

  def new
    @payment = Payment.new date: Date.today, amount: @work_unit.pay
  end

  def create
    @work_unit.payments.create! params.require(:payment).permit Payment.permitted_params
    redirect_to work_units_path
  end

  private

  def load_work_unit!
    @work_unit = WorkUnit.find params[:work_unit_id]
  end

  def authorize_work_unit! # TODO: replace with Pundit or other authorization system.
    if @work_unit.user != current_user
      flash[:error] = _ 'You are not authorized to perform that action.'
      redirect_to work_units_path
    end
  end
end
