class ClientsController < AuthorizedController
  def index
    @clients = policy_scope Client
  end

  def new
    skip_authorization
    @client = Client.new
  end

  def create
    skip_authorization
    current_user.clients.create! params.require(:client).permit Client.permitted_params
    redirect_to action: :index
  end
end
