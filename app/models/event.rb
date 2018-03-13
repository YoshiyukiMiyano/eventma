class Event < ApplicationRecord
  has_many :users
  belongs_to :user, optional: true
  
  has_many :participants, dependent: :destroy
  has_many :participant_users, through: :participants, source: :user

  validates :title,  presence: true
  validates :content,  presence: true
  validates :place,  presence: true
  validates :event_at,  presence: true
  validates :eventend_at,  presence: true

  mount_uploader :image, ImageUploader

end
