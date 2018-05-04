class User < ApplicationRecord
  validates :name, presence: true
  has_many :created_events, class_name: 'Event', foreign_key: :creator_id
  has_many :attending_events, through: :event_attendees, source: :event
end
