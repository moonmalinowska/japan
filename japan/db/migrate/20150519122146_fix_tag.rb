class FixTag < ActiveRecord::Migration
  def change
    remove_column :attractions, :tag, :string
  end
end
