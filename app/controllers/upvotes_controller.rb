class UpvotesController < ApplicationController
  def create
    resource = Resource.find(params[:resource_id])
    resource.upvotes_count += 1
    resource.save

    upvote = Upvote.new
    upvote.user_id = current_user.id
    upvote.resource_id = resource.id
    upvote.save

    @resource = resource
    upvotes = @resource.upvotes
    @users = []
    upvotes.each do |upvote|
      @users << User.find_by_id(upvote.user_id)
    end
    if signed_in?
      @recommended = Upvote.where("user_id = ? AND resource_id = ?", current_user.id, @resource.id)
    else
      @recommended = []
    end

    respond_to do |format|
      format.html { redirect_to @resource.full_path }
      format.js
    end
  end
end