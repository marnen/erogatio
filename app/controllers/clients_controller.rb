class ClientsController < AuthorizedController
  def index
    skip_policy_scope # TODO: yes, I know we'll need scoping!
    @clients = Client.all
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
