class LikesController < ApplicationController


  def index
    @todos = current_user.like_todos
  end


  def create
    Like.create(todo_id: params[:todo_id], user_id: current_user.id)
    redirect_to todo_path(params[:todo_id])
  end


  def destroy
    like = Like.find_by(todo_id: params[:id], user_id: current_user.id)
    like.destroy
    redirect_to todo_path(params[:id])
  end

end