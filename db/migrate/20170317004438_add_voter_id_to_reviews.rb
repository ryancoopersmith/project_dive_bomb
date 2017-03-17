class AddVoterIdToReviews < ActiveRecord::Migration[5.0]
  def up
    add_column :reviews, :voter_id, :text
  end

  def down
    remove_column :reviews, :voter_id
  end
end
