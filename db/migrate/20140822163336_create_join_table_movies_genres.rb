class CreateJoinTableMoviesGenres < ActiveRecord::Migration
  def change
    create_join_table :genres, :movies do |t|
      t.index [:movie_id, :genre_id]
      t.index [:genre_id, :movie_id]
    end
  end
end
