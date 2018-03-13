class CreateParticipants < ActiveRecord::Migration[5.1]
  def change
    create_table :participants do |t|
      t.integer :event_id
      t.integer :participant_id

      t.timestamps
    end
  end
end
