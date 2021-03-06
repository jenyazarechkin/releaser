class Step < ActiveRecord::Base

  acts_as_paranoid

  has_many :steps_releases, dependent: :destroy

  validates_presence_of :name

end
