class TestModel < ActiveRecord::Base
  belongs_to :map, :class_name => 'ResponseMap', :foreign_key => 'map_id'
  has_many :scores, :class_name => 'Score', :foreign_key => 'response_id', :dependent => :destroy

  delegate :questionnaire, :reviewee, :reviewer, :to => :map

  def team_has_user?(user)
    reviewer.team.has_user user
  end
end
