class CountriesRelease < ActiveRecord::Base

  belongs_to :release
  belongs_to :country

end
