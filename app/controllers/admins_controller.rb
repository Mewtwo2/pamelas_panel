class AdminsController < ApplicationController
  def new
    @admin = Admin.new
  end

  def create
    @admin = Admin.new(admin_params)
    if @admin[:admin_key] == ENV['ADMIN_KEY']
      if @admin.save
        redirect_to @admin
      else
        render 'new'
      end
    else
      redirect_to root_path
    end
  end

  def edit; end

  def show
    @admin = Admin.find(params[:id])
  end

  def index; end

  def admin_params
    params.require(:admin).permit(:username, :password, :admin_key)
  end
end
