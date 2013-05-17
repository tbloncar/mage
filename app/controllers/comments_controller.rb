class CommentsController < ApplicationController
  def create
    comment = Comment.new
    comment.user_id = current_user.id
    comment.resource_id = params[:resource_id]
    comment.content = params[:content]
    comment.save

    resource_url = comment.resource.full_path
    redirect_to resource_url
  end
end