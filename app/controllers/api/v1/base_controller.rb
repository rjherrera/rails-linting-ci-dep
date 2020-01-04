class Api::V1::BaseController < ApplicationController
  include ApiErrorConcern if Rails.env.production?

  self.responder = ApiResponder


  respond_to :json
end
