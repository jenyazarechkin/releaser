class StepsRelease < ActiveRecord::Base

  belongs_to :release
  belongs_to :step
  has_many :statuses_steps_releases, dependent: :destroy

  after_create :create_statuses_steps_releases


  def status_for_country(country)
    statuses_steps_releases.where(country: country).first
  end

  def create_statuses_steps_releases
    release.countries_releases.each do |countries_release|
      StatusesStepsRelease.create({
                                    steps_release: self,
                                    country: countries_release.country
                                  })
    end
  end

end
