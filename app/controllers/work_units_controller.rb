class WorkUnitsController < AuthorizedController
  def index
    @work_units = policy_scope(WorkUnit).includes :payments
  end

  def new
    skip_authorization
    @work_unit = WorkUnit.new
    @clients = current_user.clients.order(:name) # TODO: replace with policy_scope
  end

  def create
    skip_authorization
    params[:work_unit][:decimal_hours] = params[:work_unit][:decimal_hours].to_f
    client = current_user.clients.find params[:work_unit][:client_id] # TODO: replace with policy_scope
    client.work_units.create! params.require(:work_unit).permit WorkUnit.permitted_params
    redirect_to action: :index
  end
end
