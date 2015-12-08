class DashboardController < ApplicationController



  def index
    @teams = Team.preload(:team_members).order(:name).all
  end

end
