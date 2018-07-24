class Song

  attr_accessor :name

  @@all = []

  def initialize(name, artist = artist, genre = genre)
    @name = name
    self.artist=(artist)
    self.genre=(genre)
    @@all << self
  end

  def artist=(artist)
    @artist = artist
  end

  def artist
    @artist
  end

  def genre=(genre)
    @genre = genre
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
    Song.new(name)
  end

  def self.find_by_name(name)
    @@all.find{ |song| song.name == name }
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create(name)
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
