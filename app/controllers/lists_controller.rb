class ListsController < ApplicationController
  def index
    @lists = List.all
    render json: @lists
  end

  def show
    @user = User.find(params[:user_id])
    render json: @user.lists
  end

  def create
    @list = List.create(list_params)
      if @list.save
        render json: @list, status: :accepted
      else
        render json: { errors: 'Failed' }, status: :unprocessible_entity
    end
  end

  def update
    @list = List.find(params[:id])
    @list.update(list_params)
    render json: @list
  end

  def destroy
    @list = List.find(params[:id])
    @list.destroy
    render json: @list
  end

  private

  def list_params
    params.require(:list).permit(:title, :user_id, :games => [])
  end
end
