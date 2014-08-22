json.array!(@movies) do |movie|
  json.extract! movie, :id, :title, :year, :genre_id, :poster_url
  json.url movie_url(movie, format: :json)
end
