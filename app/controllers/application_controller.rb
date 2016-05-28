class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :set_time_zone

  include SessionsHelper

  private

  def set_time_zone
  utc_offset = @current_user && @current_user.user ? @current_user.user.time_zone_offset.to_i.minutes : 0
  user_timezone = ActiveSupport::TimeZone[utc_offset]
  Time.zone = user_timezone if user_timezone
  end
end
