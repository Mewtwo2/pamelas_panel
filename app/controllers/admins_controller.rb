class AdminsController < ApplicationController
  def new
    @admin = Admin.new
  end

  def create
    @admin = Admin.new(admin_params)
    # p "Jesus Christ"
    p "Hello World" if @admin[:admin_key] == "123456"

    if @admin.save
      redirect_to @admin
    else
      render 'new'
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
