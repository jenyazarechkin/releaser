class Release < ActiveRecord::Base

  acts_as_paranoid

  belongs_to :team
  # has_and_belongs_to_many :countries
  has_many :countries_releases, dependent: :destroy
  has_many :steps_releases, dependent: :destroy

  accepts_nested_attributes_for :countries_releases, reject_if: :all_blank

  validates_presence_of :name, :released_at, :team

end
