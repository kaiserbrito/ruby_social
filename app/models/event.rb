class Event < ApplicationRecord
  include Shared:Callbacks

  belongs_to :user
  acts_as_votable
  acts_as_commentable

  include PublicActivity::Model
  tracked only: [:create, :like], owner: Proc.new{ |controller, model| model.user }

  validates_presene_of :name
  validates_presene_of :event_datetime
  validates_presene_of :user
end
