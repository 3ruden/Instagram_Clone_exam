class UsersController < ApplicationController
  include UsersHelper

  before_action :authenticate_user, only: %i(index show edit update destroy)
  before_action :forbid_login_user, only: %i(new create)
  before_action :set_user, only: %i(show edit update destroy likes)
  before_action :ensure_correct_user, only: %i(edit update destroy)

  def index
    @users = User.all
  end

  def show
  end

  def new
    @user = User.new
    @submit_value = 'アカウント作成'
  end

  def edit
    @submit_value = 'アカウント編集'
  end

  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def likes
  end

  private
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:profile_image, :profile_image_chache, :name, :email, :password, :password_confirmation)
  end
end
