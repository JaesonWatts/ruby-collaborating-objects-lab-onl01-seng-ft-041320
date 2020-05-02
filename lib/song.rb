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
  end

  def self.new_by_filename(file_name)
    song = file_name.split(" - ")[1]
    artist = file_name.split(" - ")[0]
    new_song = self.new(song)
    new_song.artist_name = artist
    new_song
  end

  def self.all
    @@all
  end

  def artist_name=(name)
    self.artist = Artist.find_or_create_by_name(name)
    artist.add_song(self)
  end

end
