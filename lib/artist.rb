class Artist
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
    Artist.new(name)
  end

  def songs
    @songs
  end

  def add_song(song)
    if song.artist.nil?
      song.artist = self
      unless self.songs.include?(song)
        self.songs << song
      end
    end
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
