class ActivitiesController < ApplicationController
  load_and_authorize_resource
  def index
    @activities = PublicActivity::Activity.last(30).reverse
  end
end
