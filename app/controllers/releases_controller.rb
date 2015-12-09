class ReleasesController < ApplicationController
  before_action :set_release, only: [:show, :edit, :update, :destroy]
  before_action :set_teams, :set_countries, :set_steps, except: [:index, :destroy, :show]

  # GET /releases
  # GET /releases.json
  def index
    @releases = Release.preload(:team).order('released_at desc').all
  end

  # GET /releases/1
  # GET /releases/1.json
  def show
    # need some refactor
    @release_steps = @release.steps_releases.where(is_enabled: true).preload(:step).all
    @release_countries = @release.countries_releases.where(is_enabled: true).preload(:country).all
  end

  # GET /releases/new
  def new
    @release = Release.new
  end

  # GET /releases/1/edit
  def edit
  end

  # POST /releases
  # POST /releases.json
  def create
    @release = Release.new(release_params)
    # @release.steps_releases =

    respond_to do |format|
      if @release.save
        format.html { redirect_to @release, notice: 'Release was successfully created.' }
        format.json { render :show, status: :created, location: @release }
      else
        format.html { render :new }
        format.json { render json: @release.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /releases/1
  # PATCH/PUT /releases/1.json
  def update
    respond_to do |format|
      if @release.update(release_params)
        format.html { redirect_to @release, notice: 'Release was successfully updated.' }
        format.json { render :show, status: :ok, location: @release }
      else
        format.html { render :edit }
        format.json { render json: @release.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /releases/1
  # DELETE /releases/1.json
  def destroy
    @release.destroy
    respond_to do |format|
      format.html { redirect_to releases_url, notice: 'Release was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_release
      @release = Release.find(params[:id])
    end

    def set_teams
      @teams = Team.order(:name).all
    end

    def set_countries
      @countries = Country.order(:name).all
    end

    def set_steps
      @steps = Step.order(:name).all
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def release_params
      params.require(:release).permit(
        :name,
        :released_at,
        :team_id,
        countries_releases_attributes: [
          :id,
          :country_id,
          :release_id,
          :version,
          :is_enabled
        ],
        steps_releases_attributes: [
          :id,
          :step_id,
          :release_id,
          :is_enabled,
          :status
        ]
      )
    end
end
