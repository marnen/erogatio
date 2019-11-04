class WorkUnitsController < AuthorizedController
  def index
    @work_units = policy_scope(WorkUnit).includes :payments
  end

  def new
    skip_authorization
    @work_unit = WorkUnit.new
    @clients = policy_scope(Client).order(:name)
  end

  def create
    params[:work_unit][:decimal_hours] = params[:work_unit][:decimal_hours].to_f
    client = Client.find params[:work_unit][:client_id]
    authorize client, :create_work_unit?
    client.work_units.create! params.require(:work_unit).permit WorkUnit.permitted_params
    redirect_to action: :index
  end
end
