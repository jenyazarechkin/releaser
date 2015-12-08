class Team < ActiveRecord::Base

  acts_as_paranoid

  has_many :releases, dependent: :destroy
  has_many :team_members, dependent: :destroy

  accepts_nested_attributes_for :team_members, allow_destroy: true, reject_if: :all_blank

  validates_presence_of :name, :team_members

  def members_names
    team_members.map{|team_member| team_member[:name]}.join(', ')
  end

end
