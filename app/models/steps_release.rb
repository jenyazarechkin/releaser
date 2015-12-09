class StepsRelease < ActiveRecord::Base

  belongs_to :release
  belongs_to :step
  has_many :statuses_steps_releases, dependent: :destroy

  def status_for_country(country)
    statuses_steps_releases.where(country: country).first
  end

end
