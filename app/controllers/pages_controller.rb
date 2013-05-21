class PagesController < ApplicationController
	def home
		@resources = Resource.home_list
		@crafts = Craft.top6
		@users = User.top6

        if current_user
            followed = []
            current_user.relationships.each do |r|
                followed << User.find(r.followed_id)
            end
            @recent_resources = []
            @recommended_resources = []
            @commented_resources = []
            @recent_bundles = []
            @recommended_bundles = []
            @commented_bundles = []
            followed.each do |user|
                if !user.resources.empty?
                    if !@recent_resources.include?(user.resources.last) && @recent_resources.size < 8
                        @recent_resources << user.resources.last
                    end
                end
                if !user.upvotes.votes_for_resources.empty?
                    if user.upvotes.votes_for_resources.last.try(:upvotable) && !@recommended_resources.include?(user.upvotes.last.try(:upvotable)) && @recommended_resources.size < 8
                        @recommended_resources << user.upvotes.votes_for_resources.last.upvotable
                    end
                end 
                if !user.comments.comments_for_resources.empty?
                    if !@commented_resources.include?(user.comments.comments_for_resources.last.try(:commentable)) && @commented_resources.size < 8 && user.comments.last.try(:commentable) != nil
                        @commented_resources << user.comments.where(commentable_type: "Resource").last.commentable
                    end
                end
                # if !user.bundles.empty?
                #     if !@recent_bundles.include?(user.bundles.last) && @recent_resources.size < 8
                #         @recent_bundles << user.bundles.last
                #     end
                # end
                # if !user.upvotes.empty?
                #     if user.upvotes.where(upvotable_type: "Resource").last.upvotable && !@recommended_resources.include?(user.upvotes.last.upvotable) && @recommended_resources.size < 8
                #         @recommended_resources << user.upvotes.where(upvotable_type: "Resource").last.upvotable
                #     end
                # end 
            end
        end
	end

  def search
    @q = params[:q]
   
    @search_r = Resource.search() { keywords(params[:q]) }
    @search_c = Craft.search() { keywords(params[:q]) }
    @search_u = User.search() { keywords(params[:q]) }

    @check_r = []
    @check_c = []
    @check_u = []
 
    @search_r.each_hit_with_result { |hit, resource| @check_r << resource }
    @search_c.each_hit_with_result { |hit, craft| @check_c << craft }
    @search_u.each_hit_with_result { |hit, user| @check_u << user }
  end
end 