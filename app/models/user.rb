class User < ApplicationRecord
  has_many :events
  belongs_to :event, optional: true

  has_many :participants, dependent: :destroy
  has_many :participant_events, through: :participants, source: :event

  validates :name,  presence: true, length: { maximum: 30 }
  validates :email_address, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  before_save {email_address.downcase! }
  has_secure_password
#  validates :password, presence: true, length: { minimum: 6 }

  mount_uploader :icon, ImageUploader

end
