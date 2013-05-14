class RelationshipsController < ApplicationController
  before_filter :get_follower

  def get_follower
    @follower = current_user.id
  end

  def create
    followed = User.find(params[:user_id]).id
    Relationship.create(followed_id: followed, follower_id: @follower,
                        created_at: Time.now, updated_at: Time.now)
    @user = User.find(followed)
    respond_to do |format|
      format.html { redirect_to user_url(User.find(followed).username) }
      format.js
    end
  end

  def destroy
    followed = params[:user_id]
    Relationship.where(followed_id: followed, follower_id: @follower)[0].delete
    @user = User.find(followed)
    respond_to do |format|
      format.html { redirect_to user_url(User.find(followed).username) }
      format.js
    end
  end
end

