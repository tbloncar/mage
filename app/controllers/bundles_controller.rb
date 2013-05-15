class BundlesController < ApplicationController
  def new
    @bundle = Bundle.new
    if current_user
      @resources = current_user.resources
    end
  end

  def create
    @bundle = Bundle.new(params[:bundle])
    @bundle.user_id = current_user.id
    @bundle.path = @bundle.name.downcase.gsub(" ", "-")
    @bundle.save

    resources = params[:resources]
    temp_array = resources.split('|')
    resources_array = []
    temp_array.each do |number|
      number != '' && !resources_array.include?(number) && resources_array.size < 6 ? (resources_array << number) : ()
    end
    resources_array.each do |id_resource|
      inclusion = Inclusion.new
      inclusion.bundle_id = @bundle.id
      inclusion.resource_id = id_resource
      inclusion.save
    end

    redirect_to bundle_url(@bundle.path)
  end

  def index

  end

  def show
    @bundle = Bundle.find_by_path(params[:bundle_path])
  end

  def edit

  end

  def update

  end

  def destroy

  end
end