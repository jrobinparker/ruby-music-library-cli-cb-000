class Artist
  extend Concerns::Findable

  attr_accessor :name, :songs

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
    save
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
    Artist.new(name)
  end

  def songs
    @songs
  end

  def add_song(song)
    song.artist = self unless song.artist
    songs << song unless songs.include?(song)
  end

  def artist_songs
    Song.all.select do |song|
      song.artist == self
    end
  end

  def genres
    uniq_array = []
    artist_songs.map do |song|
      uniq_array << song.genre
    end
    uniq_array.uniq
  end

end
