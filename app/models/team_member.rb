class TeamMember < ActiveRecord::Base

  validates_presence_of :name

  belongs_to :team

end
