class AddUpvotesToReviews < ActiveRecord::Migration[5.0]
  def up
    add_column :reviews, :upvotes, :integer
  end

  def down
    remove_column :reviews, :upvotes
  end
end
