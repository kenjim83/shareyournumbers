class Movie < ActiveRecord::Base

  has_many :genres_movies
  has_many :genres, through: :genres_movies
  belongs_to :distributor


  mount_uploader :poster_url, PosterUploader

  def movie_params
    params.require(:movie).permit(:title, :year, :poster_url)
  end
end
