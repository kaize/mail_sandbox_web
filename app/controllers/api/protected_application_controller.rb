class Api::ProtectedApplicationController < Api::ApplicationController
  before_filter :authenticate_user!
end
