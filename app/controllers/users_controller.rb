class UsersController < ApplicationController
  before_action :set_users
  before_action :authenticate_user!
  def index
    @users
  end

  def show
    @user = User.find(params[:id])
  end

  def member
  end

  private

  def set_users
    @users = User.all
  end
end
