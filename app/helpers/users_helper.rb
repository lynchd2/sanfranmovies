module UsersHelper

  def get_movie(movie)
    Tmdb::Movie
    .find(movie)
    .first 
  end

  def movie_poster(movie)
    get_movie(movie).poster_path
  end

  def movie_link(movie)
    "http://www.imdb.com/title/tt#{get_movie(movie)}" if get_movie(movie)
  end

  def tagline_movie(movie)
    get_movie(movie).tagline if get_movie(movie)
  end

  def average_movie(movie)
    get_movie(movie).average if get_movie(movie)
  end
end
