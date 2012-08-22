class Web::ApplicationController < ApplicationController
  respond_to :html
  before_filter :authenticate_user!
end
