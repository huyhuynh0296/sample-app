class UsersController < ApplicationController
  def show
    @user = User.find_by id: params[:id]
    return if @user
    flash[:danger] = I18n.t "user.flash.errorshow"
    redirect_to signup_path
  end

  def new
    @user = User.new
  end

  def create
    flash[:success] = t("layouts.application.title1")
    @user = User.new user_params
    if @user.save
      redirect_to @user
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit :name, :email, :password, :password_confirmation
  end
end
