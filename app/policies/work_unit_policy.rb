class WorkUnitPolicy < ApplicationPolicy
  def update?
    record.user == user
  end

  class Scope < Scope
    def resolve
      scope.joins(:client).where Client.table_name => {user: user} # TODO: can we clean this up a bit with Squeel? Or as a named scope?
    end
  end
end
