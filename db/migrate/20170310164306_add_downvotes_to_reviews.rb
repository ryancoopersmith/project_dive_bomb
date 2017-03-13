class AddDownvotesToReviews < ActiveRecord::Migration[5.0]
  def up
    add_column :reviews, :downvotes, :integer
  end

  def down
    remove_column :reviews, :downvotes
  end
end
