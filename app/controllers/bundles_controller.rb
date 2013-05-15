class BundlesController < ApplicationController
  def new
    @bundle = Bundle.new
    if current_user
      @resources = current_user.resources
    end
  end

  def create

  end

  def index

  end

  def show

  end

  def edit

  end

  def update

  end

  def destroy

  end
end