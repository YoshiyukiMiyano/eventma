class RmEventParti < ActiveRecord::Migration[5.1]
  def change
    remove_column :participants, :participant_id, :integer
    remove_column :events, :organizer_id, :integer
  end
end
