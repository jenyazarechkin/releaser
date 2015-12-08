class Country < ActiveRecord::Base

  acts_as_paranoid

  # has_and_belongs_to_many :releases
  has_many :countries_releases, dependent: :destroy

  validates_presence_of :name

end
