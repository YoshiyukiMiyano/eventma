class AddEventendAtEvents < ActiveRecord::Migration[5.1]
  def change
        add_column :events, :eventend_at, :datetime
  end
end
