class StatusesStepsReleasesController < ApplicationController

  before_action :set_statuses_steps_release, only: [:update]

  def update
    respond_to do |format|
      p @statuses_step_release.status_color
      if @statuses_step_release.update(release_params)
        format.json {
          render json: {
            status: :ok,
            location: release_path(@statuses_step_release.steps_release.release),
            status_name: @statuses_step_release.status.humanize,
            status_color: @statuses_step_release.status_color
            }
        }
      else
        format.json {
          render json:{
                   status: :unprocessable_entity
                 }
        }
      end
    end
  end

  private

    def set_statuses_steps_release
      @statuses_step_release = StatusesStepsRelease.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def release_params
      params.require(:statuses_step_release).permit(:status)
    end
end
