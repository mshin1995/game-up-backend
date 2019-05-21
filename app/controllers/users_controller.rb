class UsersController < ApplicationController
  def index
    @users = User.all
    render json: @users
  end

  def show
    @user = User.find(params[:id])
    render json: @user
  end

  def create
    if User.find_by(email: user_params[:email])
      @user = User.find_by(email: user_params[:email])
      render json: @user
    else
      @user = User.create(user_params)
      if @user.save
        render json: @user, status: :accepted
      else
        render json: { errors: 'Failed' }, status: :unprocessible_entity
      end
    end
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    render json: @user
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :token)
  end

end
