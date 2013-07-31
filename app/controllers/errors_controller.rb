class ErrorsController < ApplicationController
  def not_found
    render template: 'errors/not_found', status: 404
  end

  def server_error
    render template: 'errors/server_error', status: 500
  end
end

