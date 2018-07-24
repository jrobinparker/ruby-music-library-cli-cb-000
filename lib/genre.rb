class Genre
  attr_accessor :name, :song
  attr_reader :songs

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
    @@all << self
  end

  def self.all
    @@all
  end

  def save
    @@all << self
  end

  def self.destroy_all
    @@all.clear
  end

  def self.create(name)
    Genre.new(name)
  end

  def genre_artists
    Song.all.select do |song|
      song.artist.genre == self
    end
  end

  def artists
    uniq_array = []
    genre_artists.map do |artist|
      uniq_array << artist.genre
    end
    uniq_array.uniq
  end

end
