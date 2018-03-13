class Participant < ApplicationRecord
  belongs_to :user
#  belongs_to :participant_id ,class_name: 'user' ,foreign_key: 'user_id'
  belongs_to :event
end
