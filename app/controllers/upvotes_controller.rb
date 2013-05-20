class UpvotesController < ApplicationController
  def create
    if params[:resource_id]
      @resource = Resource.find(params[:resource_id])
      @resource.upvotes_count += 1
      @resource.save
    elsif params[:bundle_id]
      @bundle = Bundle.find(params[:bundle_id])
      @bundle.upvotes_count += 1
      @bundle.save
    end

    @upvotable = find_upvotable
    @upvote = @upvotable.upvotes.build(params[:upvote])
    @upvote.user_id = current_user.id

    if @upvote.save
      if @upvote.upvotable_type == 'Resource'
        @recommended = Upvote.where(user_id: current_user.id, upvotable_id: @resource.id, upvotable_type: "Resource")
        respond_to do |format|
          format.html { redirect_to @upvotable.full_path }
          format.js
        end
      elsif @upvote.upvotable_type == 'Bundle'
        @recommended = Upvote.where(user_id: current_user.id, upvotable_id: @bundle.id, upvotable_type: "Bundle")
        respond_to do |format|
          format.html { redirect_to "/bundles/#{@upvotable.path}" }
          format.js
        end
      end
    end  
  end

  private

  def find_upvotable
    params.each do |name, value|
      if name =~ /(.+)_id$/
        return $1.classify.constantize.find(value)
      end
    end
  end
end