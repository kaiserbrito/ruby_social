class HomeController < ApplicationController
  respond_to :html, :js

  def index
    @activities = PublicActivity::Activity.all
  end

  def front
  end
end
