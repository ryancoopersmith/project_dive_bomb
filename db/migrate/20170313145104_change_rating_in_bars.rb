class ChangeRatingInBars < ActiveRecord::Migration[5.0]
  def up
    change_column :bars, :rating, :float
  end

  def down
    change_column :bars, :rating, :integer
  end
end
