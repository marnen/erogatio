require 'rails_helper'
require 'pundit/rspec'

RSpec.describe ClientPolicy, type: :policy do

  include_examples 'inherit from ApplicationPolicy'

  permissions :create_work_unit? do
    include_examples "allow access to given user's records only"
  end

  describe described_class::Scope do
    include_examples "scope to given user's records only"
  end
end
