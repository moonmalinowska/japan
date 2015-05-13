class FixAttraction < ActiveRecord::Migration
  def change
    remove_column :attractions, :type, :string
    add_column :attractions, :tag, :text

  end
end
