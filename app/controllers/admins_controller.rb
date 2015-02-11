class AdminsController < ApplicationController
  def index
      @admins = User.find_all_by_admin(true)
      @users = User.find_all_by_admin(false)
  end

  def add
      @user = User.find(params[:id])
      if @user.update_column("admin", true)
          redirect_to admins_index_path
      else
          redirect_to admins_index_path
      end
  end

  def remove
      @user = User.find(params[:id])
      if @user.update_column("admin", false)
          redirect_to admins_index_path
      else
          redirect_to admins_index_path
      end
  end
end
