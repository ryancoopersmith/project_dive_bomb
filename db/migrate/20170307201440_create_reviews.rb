class CreateReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :reviews do |t|
      t.integer  :drinks, null: false
      t.integer  :food, null: false
      t.integer  :entertainment, null: false
      t.integer  :vibe, null: false
      t.integer  :setting, null: false
      t.text :description

      t.belongs_to :user
      t.belongs_to :bar
    end
  end
end
