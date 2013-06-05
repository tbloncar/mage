class BundlesController < ApplicationController
  def new
    @bundle = Bundle.new
    if current_user
      @resources = []
      current_user.upvotes.votes_for_resources.each do |upvote|
        @resources << upvote.upvotable
      end
    end
  end

  def create
    @bundle = Bundle.new(params[:bundle])
    @bundle.user_id = current_user.id
    @bundle.path = @bundle.name.downcase.gsub(" ", "-")
    @bundle.upvotes_count = 1

    temp_array = params[:resources].split('|').compact.uniq
    resources_array = []
    temp_array.each do |number|
      if resources_array.size < 6
        resources_array << number
      end
    end

    if @bundle.save
      resources_array.each do |id_resource|
        inclusion = Inclusion.new
        inclusion.bundle_id = @bundle.id
        inclusion.resource_id = id_resource
        inclusion.save
      end
      
      @recommend = "true"

      upvote = Upvote.new
      upvote.user_id = current_user.id
      upvote.upvotable_id = @bundle.id
      upvote.upvotable_type = "Bundle"
      upvote.save

      redirect_to "/bundles/#{@bundle.path}"
    else
      render '/bundles/new'
    end
  end

  def index

  end

  def show
    @bundle = Bundle.find_by_path(params[:bundle_path])
    @resources = @bundle.resources
    @commentable = Comment.new
    @upvotable = Upvote.new

    if signed_in?
      @recommended = Upvote.where(user_id: current_user.id, upvotable_id: @bundle.id, upvotable_type: "Bundle")
    else
      @recommended = []
    end
  end

  def edit
    @bundle = Bundle.find_by_path(params[:bundle_path])
    if current_user
      @resources = []
      current_user.upvotes.votes_for_resources.each do |upvote|
        @resources << upvote.upvotable
      end
    end
  end

  def update

  end

  def destroy

  end
end