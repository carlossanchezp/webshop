class AddReviewCountToReviews < ActiveRecord::Migration
  def change
	add_column :reviews, :review_count, :integer
  end
end
