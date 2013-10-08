class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_user

  protected
  def must_by_logged_in
    redirect_to root_path, notice: "You must be logged in to do this" if current_user.visitor?
  end

  private

  def current_user
    @current_user ||= if session[:user_id]
                        user = User.find_by_id(session[:user_id])
                        user ? user : Visitor.new # in case of corrupted session id
                      else
                        Visitor.new
                      end
  end
end
