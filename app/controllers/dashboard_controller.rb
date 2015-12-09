class DashboardController < ApplicationController

  def index
    @team = params['team'] ? Team.find(params['team']): Team.order('name').first
    @teams = Team.preload(:team_members).order(:name).all
    if(@team.releases.present?)
      @release= @team.releases.order('released_at desc').first
      @steps_releases = @release.steps_releases.where(is_enabled: true).preload(:step).all
      @countries_releases = @release.countries_releases.where(is_enabled: true).preload(:country).all
    end
  end

end
