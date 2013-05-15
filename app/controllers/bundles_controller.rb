class BundlesController < ApplicationController
  def new
    @bundle = Bundle.new
    @resources = current_user.resources
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