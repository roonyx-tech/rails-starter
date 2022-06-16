class ApplicationController < ActionController::Base
  def ping
    render json: { answer: ['PONG', params[:name].presence || 'My friend'].compact.join(' ') }
  end
end
