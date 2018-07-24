class Song
  attr_accessor :name

  @@all = []

  def initialize(name, artist = self.artist, genre = self.genre)
    @name = name
    @artist = artist
    @genre = genre
    @@all << self
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
    if @genre.song.nil?
      @genre.song = self
      unless @genre.songs.include?(self)
        @genre.songs << self
      end
    end
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
    artist_name = filename.split(" - ")[0].chomp
    song_name = filename.split(" - ")[1].chomp
    song = Song.new(name = song_name, artist = artist_name)
    song
  end

end
