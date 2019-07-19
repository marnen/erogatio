class WorkUnitsController < ApplicationController
  before_action :require_login

  def index
    @work_units = WorkUnit.all # TODO: Yes, we will need to scope this to user!
  end

  def new
    @work_unit = WorkUnit.new
  end

  def create
    current_user.work_units.create! params.require(:work_unit).permit(:date, :hours, :description)
    redirect_to action: :index
  end
end
