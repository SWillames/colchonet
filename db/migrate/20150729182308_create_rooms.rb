class CreateRooms < ActiveRecord::Migration
  def change
    create_table :rooms do |t|
      t.string :title
      t.string :location
      t.text :description

      t.index :title, unique: true

      t.timestamps null: false
    end
  end
end
