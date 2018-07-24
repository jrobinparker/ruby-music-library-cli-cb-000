class Genre
  extend Concerns::Findable

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
      song.genre == self
    end
  end

  def artists
    uniq_array = []
    genre_artists.map do |song|
      uniq_array << song.artist
    end
    uniq_array.uniq
  end

end
