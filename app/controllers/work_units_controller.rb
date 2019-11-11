class WorkUnitsController < AuthorizedController
  def index
    @work_units = policy_scope(WorkUnit).includes :payments
  end

  def new
    skip_authorization
    load_clients!
    @work_unit = WorkUnit.new
  end

  def create
    client = load_and_authorize_client
    client.work_units.create! params.require(:work_unit).permit WorkUnit.permitted_params
    redirect_to action: :index
  end

  def edit
    load_clients!
    @work_unit = authorize WorkUnit.find(params[:id])
  end

  def update
    work_unit = authorize WorkUnit.find(params[:id])
    client = load_and_authorize_client
    work_unit.update_attributes! params.require(:work_unit).permit WorkUnit.permitted_params
    redirect_to action: :index
  end

  private

  def load_clients!
    @clients = policy_scope(Client).order(:name) # TODO: consider Cells for this
  end

  def load_and_authorize_client
    client = Client.find params[:work_unit][:client_id]
    authorize client, :create_work_unit?
  end
end
