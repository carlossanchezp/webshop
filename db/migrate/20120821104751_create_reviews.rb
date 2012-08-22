class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :summary
      t.text :description
      t.string :rating_integer

      t.timestamps
    end
  end
end
