class StepsRelease < ActiveRecord::Base

  belongs_to :release
  belongs_to :step

end
