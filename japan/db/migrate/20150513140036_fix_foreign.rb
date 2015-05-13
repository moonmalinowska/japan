class FixForeign < ActiveRecord::Migration
  def change
    add_column :attractions, :category_id, :integer
    add_column :attractions, :region_id, :integer
  end
end
