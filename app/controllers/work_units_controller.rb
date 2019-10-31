class WorkUnitsController < AuthorizedController
  def index
    @work_units = policy_scope(WorkUnit).includes :payments
  end

  def new
    skip_authorization
    @work_unit = WorkUnit.new
  end

  def create
    skip_authorization
    params[:work_unit][:decimal_hours] = params[:work_unit][:decimal_hours].to_f
    current_user.work_units.create! params.require(:work_unit).permit WorkUnit.permitted_params
    redirect_to action: :index
  end
end
