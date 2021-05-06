class RemoveRatingIdFromPost < ActiveRecord::Migration[6.1]
  def change
    remove_column :posts, :rating_id, :integer
  end
end
