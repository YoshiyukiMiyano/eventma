class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.string :title
      t.text :content
      t.string :image
      t.integer :organizer_id

      t.timestamps
    end
  end
end
