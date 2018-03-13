class AddEventAtEvents < ActiveRecord::Migration[5.1]
  def change
        add_column :events, :event_at, :datetime
  end
end
