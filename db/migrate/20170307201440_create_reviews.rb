class CreateReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :reviews do |t|
      t.string :username, null: false
      t.float  :drinks, null: false
      t.float  :food, null: false
      t.float  :entertainment, null: false
      t.float  :vibe, null: false
      t.float  :decor, null: false
      t.text :description, null: false

      t.belongs_to :bar
    end
  end
end
