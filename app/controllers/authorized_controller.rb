class AuthorizedController < ApplicationController
  before_action :require_login
  after_action :verify_authorized, except: :index
  after_action :verify_policy_scoped, only: :index
end
