# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  def not_found
    raise ActionController::RoutingError.new('Not Found')
  end

  rescue_from ActiveRecord::RecordNotFound, with: :back_to_memes

  def back_to_memes(exception)
    redirect_to root_path
  end
end
