class MembersController < ApplicationController
  before_action :set_users
  before_action :authenticate_user!

  def index
    @users
  end

  def show
    @user = User.find(params[:id])
    @mine = Note.where(user_id: current_user.id).order('created_at DESC')
  end


  def mine
  end

  private

  def set_users
    @users = User.all
  end
end
