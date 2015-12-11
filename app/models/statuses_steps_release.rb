class StatusesStepsRelease < ActiveRecord::Base

  after_initialize :set_defaults

  belongs_to :steps_release
  belongs_to :country

  enum status: [
         :not_started,
         :in_progress,
         :skipped,
         :failed,
         :done
       ]

  def status_color
    %w(btn-default btn-primary btn-warning btn-success btn-danger)[StatusesStepsRelease.statuses[self.status]]
  end

  private

  def set_defaults
    self.status ||= 0
  end



end
