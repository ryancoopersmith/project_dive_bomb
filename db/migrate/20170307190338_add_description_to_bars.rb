class AddDescriptionToBars < ActiveRecord::Migration[5.0]
  def up
    add_column :bars, :description, :text
  end

  def down
    remove_column :bars, :description
  end
end
