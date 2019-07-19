class WorkUnitsController < ApplicationController
  before_action :require_login

  def index
    @work_units = current_user.work_units
  end

  def new
    @work_unit = WorkUnit.new
  end

  def create
    params[:work_unit][:hours] = params[:work_unit][:hours].to_i.hours
    current_user.work_units.create! params.require(:work_unit).permit(:date, :hours, :description)
    redirect_to action: :index
  end
end
