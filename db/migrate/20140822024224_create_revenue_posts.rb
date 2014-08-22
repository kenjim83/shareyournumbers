class CreateRevenuePosts < ActiveRecord::Migration
  def change
    create_table :revenue_posts do |t|
      t.belongs_to :user, index: true
      t.belongs_to :movie, index: true
      t.belongs_to :distributor, index: true
      t.integer :revenue
      t.boolean :published
      t.string :source_url

      t.timestamps
    end
  end
end
