class SessionsController < ApplicationController
  def new
  end

  def create
    @admin = Admin.find_by(username: params[:session][:username].downcase)
    if @admin
      log_in(@admin)
      redirect_to root_path
    else
      msg = "invalid credentials"
      render "new"
    end
  end

  def destroy
    session[:admin_id] = nil
    log_out if logged_in?
    redirect_to root_path
  end
end
