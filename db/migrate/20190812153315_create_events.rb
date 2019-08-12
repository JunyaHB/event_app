class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.string :event_name
      t.date :date
      t.text :content
      t.string :event_image
      t.integer :user_id

      t.timestamps
    end
  end
end
