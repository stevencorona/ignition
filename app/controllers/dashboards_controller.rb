class DashboardsController < ApplicationController
  before_filter :authenticate

  def show
    @upcoming = Hackathon.where(state: "upcoming")
    @previous = Hackathon.where(state: "finished")
  end
end
