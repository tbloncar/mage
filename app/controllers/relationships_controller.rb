class RelationshipsController < ApplicationController

  def create
    follower = current_user.id
    followed = User.find(params[:user_id]).id
    Relationship.create(followed_id: followed, follower_id: follower,
                        created_at: Time.now, updated_at: Time.now)

    redirect_to user_url(User.find(followed).username)
  end

  def destroy
    follower = current_user.id
    followed = params[:user_id]
    Relationship.where(followed_id: followed, follower_id: follower)[0].delete

    redirect_to user_url(User.find(followed).username)
  end
end

