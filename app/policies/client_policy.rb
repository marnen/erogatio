class ClientPolicy < ApplicationPolicy
  def create_work_unit?
    record.user_id == user.id
  end

  class Scope < Scope
    def resolve
      scope.where user_id: user.id
    end
  end
end
