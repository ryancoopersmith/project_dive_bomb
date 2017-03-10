class AddVotesToReviews < ActiveRecord::Migration[5.0]
  def up
    add_column :reviews, :votes, :integer
  end

  def down
    remove_column :reviews, :votes
  end
end
