# Add any new genres to db:

genres = [
'Action',
'Adventure',
'Animation',
'Biography',
'Comedy',
'Crime',
'Documentary',
'Drama',
'Family',
'Fantasy',
'History',
'Horror',
'Music',
'Musical',
'Mystery',
'Romance',
'Sci-Fi',
'Sport',
'Thriller',
'War',
'Western'
]


all_genres_in_db = Genre.pluck(:name)

genres.each do |genre_name|
  unless all_genres_in_db.include? genre_name
    Genre.create(name: genre_name)
    puts "Adding new genre entry: #{genre_name}"
  end
end

# Add initial movies

starting_movies = [
  ['Escape From Tomorrow', 2013],
  ['Margin Call', 2011],
  ['Melancholia', 2011],
  ['Black Death', 2011],
  ['13 Assassins', 2011],
  ['All Good Things', 2010],
  ['Arbitrage', 2012],
  ['Bachelorette', 2012],
  ['Monsters', 2010],
  ['Drinking Buddies', 2013],
  ['Only God Forgives', 2013],
  ['Bridesmaids', 2011],
  ['American: The Bill Hicks Story', 2011],
  ['Billionaire', 2011],
  ['Elephant in the Living Room', 2011],
  ['DMT: The Spirit Molecule', 2011],
  ['Fat Sick & Nearly Dead', 2011],
  ['5 Star Day', 2011],
  ['Until The Light Takes Us', 2011]
]

starting_movies.each do |movie|
  Movie.create(title: movie[0], year: movie[1])
end

# Populate genres_movies Join Table

movies_genres = {
  'Escape From Tomorrow' =>           ['Fantasy', 'Horror'],
  'Margin Call' =>                    ['Drama'],
  'Melancholia' =>                    ['Drama'],
  'Black Death' =>                    ['Action', 'Drama'],
  '13 Assassins' =>                   ['Action', 'Adventure', 'Drama'],
  'All Good Things' =>                ['Crime', 'Mystery', 'Drama'],
  'Arbitrage' =>                      ['Drama', 'Thriller'],
  'Bachelorette' =>                   ['Comedy', 'Romance'],
  'Monsters' =>                       ['Drama', 'Sci-Fi', 'Thriller'],
  'Drinking Buddies' =>               ['Drama', 'Romance'],
  'Only God Forgives' =>              ['Crime', 'Thriller', 'Drama'],
  'Bridesmaids' =>                    ['Comedy', 'Romance'],
  'American: The Bill Hicks Story' => ['Documentary', 'Biography'],
  'Billionaire' =>                    ['Documentary'],
  'Elephant in the Living Room' =>    ['Documentary'],
  'DMT: The Spirit Molecule' =>       ['Documentary'],
  'Fat Sick & Nearly Dead' =>         ['Documentary'],
  '5 Star Day' =>                     ['Drama', 'Romance'],
  'Until The Light Takes Us' =>       ['Documentary']
}

movies_genres.each do |title, genres|
  genres.each do |genre|
    GenresMovie.create( movie_id: Movie.find_by_title(title).id, genre_id: Genre.find_by_name(genre).id )
  end
end