#
#
# class Song
#   attr_accessor :name, :artist
#   @@all = []
#   def initialize(name, artist=nil)
#     @name = name
#     @artist = artist
#     @@all << self
#   end
#
#   def artist_name=(name)
#     if (self.artist.nil?)
#       self.artist = Artist.new(name)
#     else
#       self.artist.name = name
#     end
#   end
#
#   def self.new_by_filename(filename)
#     song = self.new()
#     song.title = filename.split(" - ")[1]
#     song
#   end
#
#   def self.all
#     @@all
#   end
#
# end

class Song

  attr_accessor :name, :artist
  @@all = []
  def initialize(name)
    @name = name
    @@all << self
  end

  def self.new_by_filename(filename)
      artist_name, song_name, extra = filename.split(" - ")
      song = self.new(song_name)
      artist = Artist.find_or_create_by_name(artist_name)
      artist.add_song(song)
    end

  def self.all
    @@all
  end

  def artist_name=(name)
    self.artist = Artist.find_or_create_by_name(name)
    artist.add_song(self)
  end

end
