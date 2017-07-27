class AddPictureToTwitterposts < ActiveRecord::Migration[5.1]
  def change
    add_column :twitterposts, :picture, :string
  end
end
