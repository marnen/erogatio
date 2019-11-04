require 'rails_helper'
require 'pundit/rspec'

RSpec.describe WorkUnitPolicy, type: :policy do

  include_examples 'inherit from ApplicationPolicy'

  permissions :update?, :edit? do
    include_examples "allow access to given user's records only"
  end

  describe described_class::Scope do
    include_examples "scope to given user's records only"
  end
end
