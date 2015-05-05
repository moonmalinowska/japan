class CreateAttractions < ActiveRecord::Migration
  def change
    create_table :attractions do |t|
      t.string :type
      t.string :name
      t.text :description
      t.text :address
      t.string :opening_hour
      t.string :duration
      t.string :reservation
      t.text :more_info
      t.text :picture
      t.text :url

      t.timestamps null: false
    end
  end
end
