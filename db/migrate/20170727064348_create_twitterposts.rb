class CreateTwitterposts < ActiveRecord::Migration[5.1]
  def change
    create_table :twitterposts do |t|
      t.text :content
      t.references :user, foreign_key: true

      t.timestamps
    end
     add_index :twitterposts, [:user_id, :created_at]
  end
end
