class Web::ProtectedApplicationController < Web::ApplicationController
  before_filter :authenticate_user!
end
