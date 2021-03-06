class PaymentsController < AuthorizedController
  before_action :load_and_authorize_work_unit!

  def new
    @payment = Payment.new date: Date.today, amount: @work_unit.pay
  end

  def create
    @work_unit.payments.create! params.require(:payment).permit Payment.permitted_params
    redirect_to work_units_path
  end

  private

  def load_and_authorize_work_unit!
    @work_unit = WorkUnit.find params[:work_unit_id]
    authorize @work_unit, :update?
  end
end
