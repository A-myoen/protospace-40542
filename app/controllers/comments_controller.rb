class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @prototype = Prototype.find(params[:prototype_id])
    @comment = @prototype.comments.build(comment_params)
    @comment.user = current_user
    if @comment.save
      redirect_to prototype_path(params[:prototype_id]) 
  else
    @comments = @prototype.comments 
    render 'prototypes/show', prototype: @prototype
  end
end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, prototype_id: params[:prototype_id])
  end
end
