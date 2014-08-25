class AddDistributorIdToMovies < ActiveRecord::Migration
  def change
    add_column :movies, :distributor_id, :integer
    add_index :movies, :distributor_id
  end
end
