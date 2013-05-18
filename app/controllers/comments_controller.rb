class CommentsController < ApplicationController
  def create
    @commentable = find_commentable
    @comment = @commentable.comments.build(params[:comment])
    @comment.user_id = current_user.id
    if @comment.save
      if @comment.commentable_type == 'Resource'
        redirect_to @commentable.full_path
      elsif @comment.commentable_type == 'Bundle'
        redirect_to "/bundles/#{@commentable.path}"
      end
    end
  end

  private

  def find_commentable
    params.each do |name, value|
      if name =~ /(.+)_id$/
        return $1.classify.constantize.find(value)
      end
    end
  end
end