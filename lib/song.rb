class Song

  attr_accessor :name
  attr_reader :genre, :artist

  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist if artist
    self.genre = genre if genre
    save
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def artist
    @artist
  end

  def genre=(genre)
    @genre = genre
    genre.songs << self unless genre.songs.include?(self)
  end

  def genre
    @genre
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
    song = new(name)
    song.save
    song
  end

  def self.find_by_name(name)
    all.detect{ |s| s.name == name }
  end

  def self.find_or_create_by_name(name)
    find_by_name(name) || create(name)
  end

  def self.new_from_filename(filename)
      artist, name = filename.split(" - ")
      song = Song.new(name, artist)
      song
  end

  def self.create_from_filename(filename)
    new_song = self.new_from_filename(filename)
    new_song.artist_name = artist
    new_song
  end

end
